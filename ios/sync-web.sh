#!/bin/bash
# Re-copy the current dashboard site into the app's bundled Web folder.
# Run this from the repo root after you edit any of the .html / .js files
# so the iPhone app picks up your changes the next time you build in Xcode.
#
#   ./ios/sync-web.sh
#
set -e
cd "$(dirname "$0")/.."
cp index.html health.html gym.html finance.html po-water.html topbar.js sync.js ios/Web/
echo "Synced site into ios/Web. Now rebuild the app in Xcode (press Run)."
