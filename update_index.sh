#!/bin/bash
set -e
cd "$(dirname "$0")"
{
  printf '<!DOCTYPE html><html lang="zh"><head><meta charset="utf-8"><title>HTML Visualizations</title>'
  printf '<style>body{font-family:-apple-system,Helvetica,Arial,sans-serif;max-width:900px;margin:40px auto;padding:20px;color:#222}h1{font-size:22px;border-bottom:2px solid #333;padding-bottom:8px}ul{font-size:15px;line-height:2;list-style:none;padding-left:0}li{padding:6px 10px;border-bottom:1px solid #eee}a{color:#0366d6;text-decoration:none}a:hover{text-decoration:underline}.meta{color:#888;font-size:12px;margin-left:8px;font-family:monospace}</style>'
  printf '</head><body><h1>HTML Visualizations</h1><ul>'
  for f in $(ls *.html 2>/dev/null | grep -v '^index.html$' | sort); do
    size=$(du -h "$f" | cut -f1)
    mtime=$(date -r "$f" '+%Y-%m-%d')
    printf '<li><a href="%s">%s</a><span class="meta">%s · %s</span></li>' "$f" "$f" "$size" "$mtime"
  done
  printf '</ul></body></html>'
} > index.html
echo "index.html updated ($(ls *.html | grep -v '^index.html$' | wc -l) entries)"
