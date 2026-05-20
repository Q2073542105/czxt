#!/bin/bash
set -e
shopt -s nullglob

mkdir -p /root/os/linux-0.11-lab/b

for f in *; do
  if [ "$f" = "install.sh" ]; then
    continue
  fi
  if [ -f "$f" ]; then
    cp -f "$f" /root/os/linux-0.11-lab/b/
  fi
done
