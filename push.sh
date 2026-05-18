#!/bin/bash
set -e
cd "$(dirname "$0")"
./update_index.sh
git add -A
if git diff --cached --quiet; then
  echo 'no changes to commit'
  exit 0
fi
msg="${1:-update visualizations}"
git commit -m "$msg"
git push
