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

# Script's directory — filters, templates, defaults, and draft output live here
# NOTE: must be resolved before OUTPUT_HTML/OUTPUT_PDF which reference it
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Resolve absolute paths so cd doesn't break relative references
INPUT_ABS="$(cd "$(dirname "$INPUT")" && pwd)/$(basename "$INPUT")"
INPUT_DIR="$(dirname "$INPUT_ABS")"
BASENAME="$(basename "$INPUT_ABS" .md)"
OUTPUT_HTML="$SCRIPT_DIR/draft/${BASENAME}.html"
OUTPUT_PDF="$SCRIPT_DIR/draft/${BASENAME}.pdf"

# --- locate Chrome (macOS app bundles and WSL/Git Bash Windows paths) ---
# TODO: remove find_chrome() and the --pdf flag once pandoc PDF generation
#       is reliable, or once the Playwright path below is adopted instead.
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
#       PDF generation bug is resolved. Remove --pdf flag, find_chrome(),
#       and the Chrome dependency check above at that point.
#
# KNOWN ISSUE: Chrome's --print-to-pdf-no-header flag is broken in all
# current headless modes. Both --headless (legacy) and --headless=new fail
# to suppress the running header (URL) and footer (date, page N of M).
# Validated broken as of Chrome 121+ across both engines.
# Chromium bug: https://bugs.chromium.org/p/chromium/issues/detail?id=1378911
#
# The PDF produced here will contain Chrome headers/footers. A post-processing
# crop step (see TODO below) is needed to remove them until this is resolved.
#
# FUTURE FIX — replace the Chrome CLI block below with Playwright, which
# suppresses headers via the DevTools Protocol (displayHeaderFooter: false)
# rather than relying on the broken CLI flag:
#
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
# TODO: add a post-processing step using pikepdf or ghostscript to crop the
#       top and bottom margin bands (~30pt each) where Chrome renders its
#       headers/footers, as an interim fix until Playwright is adopted or
#       the Chromium bug is resolved.
#
if $MAKE_PDF; then
    printf "PDF:  generating via Chrome --headless=new... "
    "$CHROME" \
      --headless=new \
      --no-sandbox \
      --print-to-pdf="$OUTPUT_PDF" \
      "file://${OUTPUT_HTML}" \
      2>/dev/null
    if [ -f "$OUTPUT_PDF" ]; then
        printf "done\n"
        printf "PDF:  %s\n" "$OUTPUT_PDF"
        printf "Note: Chrome headers/footers present (Chromium bug #1378911).\n"
        printf "      See FUTURE FIX and TODO comments in mkdocs.sh.\n"
    else
        printf "failed\n"
        printf "Error: PDF generation failed.\n" >&2
    fi
fi
