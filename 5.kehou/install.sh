#!/bin/bash
set -e
shopt -s nullglob

mkdir -p /data/workspace/myshixun

for f in *; do
  if [ "$f" = "install.sh" ]; then
    continue
  fi
  if [ -f "$f" ]; then
    cp -f "$f" /data/workspace/myshixun/
  fi
done
