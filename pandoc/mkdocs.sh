#! /bin/bash

usage() {
    echo "Usage: $(basename "$0") [--pdf] <input.md>"
    echo ""
    echo "  Generates an HTML document from the given markdown file."
    echo "  --pdf   Also produce a PDF via Chrome headless (requires Chrome)."
    echo "          PDF is generated from the HTML output, not directly from markdown."
    exit 1
}

# --- parse arguments ---
MAKE_PDF=false
POSITIONAL=()
for arg in "$@"; do
    case "$arg" in
        --pdf) MAKE_PDF=true ;;
        --help|-h) usage ;;
        *) POSITIONAL+=("$arg") ;;
    esac
done
set -- "${POSITIONAL[@]}"
[ $# -lt 1 ] && usage

INPUT="$1"
[ ! -f "$INPUT" ] && echo "Error: input file '$INPUT' not found." && exit 1

# Resolve absolute paths so cd doesn't break relative references
INPUT_ABS="$(cd "$(dirname "$INPUT")" && pwd)/$(basename "$INPUT")"
INPUT_DIR="$(dirname "$INPUT_ABS")"
BASENAME="$(basename "$INPUT_ABS" .md)"
OUTPUT_HTML="$SCRIPT_DIR/draft/${BASENAME}.html"
OUTPUT_PDF="$SCRIPT_DIR/draft/${BASENAME}.pdf"

# Script's directory — filters, templates, and defaults live here
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- locate Chrome (macOS app bundles and WSL/Git Bash Windows paths) ---
# TODO: remove this function once pandoc PDF generation is reliable
find_chrome() {
    # Check PATH first (covers Linux packages and some custom installs)
    for name in google-chrome google-chrome-stable chromium chromium-browser; do
        if command -v "$name" >/dev/null 2>&1; then
            echo "$(command -v "$name")"
            return
        fi
    done

    # macOS: standard and user-level app bundle locations
    local macos_paths=(
        "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
        "$HOME/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
        "/Applications/Chromium.app/Contents/MacOS/Chromium"
        "$HOME/Applications/Chromium.app/Contents/MacOS/Chromium"
    )
    for p in "${macos_paths[@]}"; do
        [ -x "$p" ] && echo "$p" && return
    done

    # WSL / Git Bash: standard Windows install locations
    local win_paths=(
        "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
        "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"
    )
    for p in "${win_paths[@]}"; do
        [ -x "$p" ] && echo "$p" && return
    done

    echo ""
}

# --- check dependencies ---
if ! command -v pandoc >/dev/null 2>&1; then
    echo "Error: cannot find pandoc. Exiting." && exit 1
fi
PANDOC=$(command -v pandoc)

if ! command -v git >/dev/null 2>&1; then
    echo "Error: cannot find git. Exiting." && exit 2
fi
GIT=$(command -v git)

# --- if PDF requested, resolve Chrome now before doing any work ---
CHROME=""
if $MAKE_PDF; then
    CHROME="$(find_chrome)"
    if [ -z "$CHROME" ]; then
        printf "Chrome was not found on this system.\n"
        printf "PDF generation requires Chrome or Chromium to be installed.\n"
        printf "Proceed with HTML-only output? [y/N] "
        read -r answer
        case "$answer" in
            [yY]|[yY][eE][sS]) MAKE_PDF=false ;;
            *) echo "Aborted." && exit 4 ;;
        esac
    fi
fi

# --- show what we're using ---
printf "Using %s\n" "$($PANDOC --version | head -1)"
printf "Using %s\n" "$($GIT --version)"
$MAKE_PDF && printf "Using Chrome: %s\n" "$CHROME"
printf "\n"

# --- capture git revision (non-fatal: warn and omit if not in a repo) ---
GIT_META=()
if $GIT -C "$INPUT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    GIT_REV="$($GIT -C "$INPUT_DIR" rev-parse --short HEAD) · $($GIT -C "$INPUT_DIR" branch --show-current) · $($GIT -C "$INPUT_DIR" log -1 --format='%ci' | cut -d' ' -f1)"
    GIT_META=(--metadata "git-revision=$GIT_REV")
else
    printf "Warning: not inside a git repository; revision metadata will be omitted.\n\n"
fi

# --- run pandoc from the input file's directory so CSS and image paths resolve ---
cd "$INPUT_DIR"

$PANDOC -f gfm+definition_lists -t html \
  -c styles/markdown-styles-v1.7.3a.css \
  -s \
  --template "$SCRIPT_DIR/templates/default.html" \
  --lua-filter "$SCRIPT_DIR/diagram.lua" \
  --lua-filter "$SCRIPT_DIR/meta_vars.lua" \
  --defaults "$SCRIPT_DIR/defaults.yaml" \
  --embed-resources \
  "${GIT_META[@]}" \
  -o "$OUTPUT_HTML" \
  "$INPUT_ABS"

printf "HTML: %s\n" "$OUTPUT_HTML"

# --- optionally produce PDF from the completed HTML via Chrome headless ---
#
# TODO: replace this entire block with pandoc native PDF once the pandoc
#       PDF generation bug is resolved. At that point, remove the --pdf flag,
#       find_chrome(), and the Chrome dependency check above.
#
# PDF ENGINE SELECTION
# Chrome has two headless engines with different behaviours:
#
#   --headless (legacy engine)
#       Supports --print-to-pdf-no-header, which suppresses Chrome's default
#       running headers (URL) and footers (date, page N of M). This is the
#       engine we prefer. Google has marked it deprecated but has not yet
#       removed it as of early 2026.
#
#   --headless=new (current engine, default in Chrome 112+)
#       Does NOT honour --print-to-pdf-no-header due to an unresolved
#       Chromium regression. Headers and footers appear in the PDF output.
#       Chromium bug: https://bugs.chromium.org/p/chromium/issues/detail?id=1378911
#
# RUNTIME SELECTION STRATEGY
# We attempt the legacy engine first and detect success by checking whether
# the output file was actually written (Chrome does not reliably return
# non-zero exit codes on failure). If the legacy engine has been removed,
# we fall back to --headless=new and warn that headers/footers may appear.
#
# WHEN LEGACY ENGINE IS EVENTUALLY REMOVED
# Replace the Chrome block below with a small Playwright or Puppeteer script
# that calls page.pdf({ displayHeaderFooter: false }) via the DevTools
# Protocol — which is how those tools suppress headers internally:
#
#   npx playwright pdf --no-header-footer "file://${OUTPUT_HTML}" "$OUTPUT_PDF"
#   -- or --
#   node -e "
#     const { chromium } = require('playwright');
#     (async () => {
#       const b = await chromium.launch();
#       const p = await b.newPage();
#       await p.goto('file://${OUTPUT_HTML}');
#       await p.pdf({ path: '${OUTPUT_PDF}', displayHeaderFooter: false, format: 'A4' });
#       await b.close();
#     })();"
#
if $MAKE_PDF; then
    rm -f "$OUTPUT_PDF"  # ensure stale file does not mask a failed run

    printf "PDF:  attempting legacy Chrome headless engine... "
    "$CHROME" \
      --headless \
      --no-sandbox \
      --print-to-pdf-no-header \
      --print-to-pdf="$OUTPUT_PDF" \
      "file://${OUTPUT_HTML}" \
      2>/dev/null

    if [ -f "$OUTPUT_PDF" ]; then
        printf "OK (legacy engine, headers suppressed)\n"
        printf "PDF:  %s\n" "$OUTPUT_PDF"
    else
        printf "unavailable\n"
        printf "PDF:  falling back to --headless=new (headers/footers will appear).\n"
        printf "      Once Chrome removes the legacy engine, replace this block\n"
        printf "      with a Playwright/Puppeteer script — see comments in mkdocs.sh.\n"
        "$CHROME" \
          --headless=new \
          --no-sandbox \
          --print-to-pdf="$OUTPUT_PDF" \
          "file://${OUTPUT_HTML}" \
          2>/dev/null
        if [ -f "$OUTPUT_PDF" ]; then
            printf "PDF:  %s\n" "$OUTPUT_PDF"
        else
            printf "Error: PDF generation failed with both Chrome headless engines.\n" >&2
        fi
    fi
fi
