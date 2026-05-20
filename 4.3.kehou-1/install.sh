#!/bin/bash
set -e
shopt -s nullglob

mkdir -p /data/workspace/myshixun

for f in gdb.log dbg.log; do
  if [ -f "$f" ]; then
    cp -f "$f" /root/
  fi
done

for f in *.txt history*.log; do
  if [ -f "$f" ]; then
    cp -f "$f" /data/workspace/myshixun/
  fi
done
