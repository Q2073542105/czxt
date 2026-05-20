#!/bin/bash
set -e

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ls /data/workspace/myshixun/exp2
cp /data/workspace/myshixun/exp2/1.3.tgz ~/os

cd ~/os/linux-0.11-lab
tar -zxvf ../1.3.tgz 1.3

cp -f "$src_dir/main.c" 1.3/linux/init/main.c
cp -f "$src_dir/memory.c" 1.3/linux/mm/memory.c

rm -rf cur
ln -s 1.3 cur
ls

cd 1.3/linux
make

cd ../..
./run
