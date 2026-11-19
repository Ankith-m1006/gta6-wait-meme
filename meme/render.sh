#!/usr/bin/env bash
# Renders meme/meme.html to meme/gta6-wait-meme.png (1600 x 1000) with headless Chrome.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
chrome="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
profile="$(mktemp -d)"
"$chrome" --headless=new --hide-scrollbars --force-device-scale-factor=1 \
  --user-data-dir="$profile" --window-size=1600,1000 --virtual-time-budget=2000 \
  --screenshot="$here/gta6-wait-meme.png" "file:///$(cygpath -m "$here/meme.html" 2>/dev/null || echo "$here/meme.html")"
rm -rf "$profile"
