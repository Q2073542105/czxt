#!/bin/bash
set -e
shopt -s nullglob

mkdir -p /data/workspace/userfiles

for f in *; do
  if [ "$f" = "install.sh" ]; then
    continue
  fi
  if [ -f "$f" ]; then
    cp -f "$f" /data/workspace/userfiles/
  fi
done
