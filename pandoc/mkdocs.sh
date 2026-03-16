#! /bin/bash

usage() {
    echo "Usage: $(basename "$0") <input.md>"
    exit 1
}

# --- validate input argument ---
[ $# -lt 1 ] && usage
INPUT="$1"
[ ! -f "$INPUT" ] && echo "Error: input file '$INPUT' not found." && exit 1

# Resolve absolute paths so cd doesn't break relative references
INPUT_ABS="$(cd "$(dirname "$INPUT")" && pwd)/$(basename "$INPUT")"
INPUT_DIR="$(dirname "$INPUT_ABS")"
OUTPUT="/tmp/$(basename "$INPUT_ABS" .md).html"

# Script's directory — filters, templates, and defaults live here
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- check dependencies ---
if ! command -v pandoc >/dev/null 2>&1; then
    echo "Error: cannot find pandoc. Exiting." && exit 1
fi
PANDOC=$(command -v pandoc)

if ! command -v git >/dev/null 2>&1; then
    echo "Error: cannot find git. Exiting." && exit 2
fi
GIT=$(command -v git)

# --- show what we're using ---
printf "Using %s\n" "$($PANDOC --version | head -1)"
printf "Using %s\n\n" "$($GIT --version)"

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
  -o "$OUTPUT" \
  "$INPUT_ABS"

printf "\nOutput: %s\n" "$OUTPUT"