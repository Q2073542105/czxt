#!/bin/bash
set -e

REPO_ZIP_URL="https://github.com/Q2073542105/czxt/archive/refs/heads/main.zip"

if [ $# -lt 1 ]; then
  echo "用法: bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Q2073542105/czxt/main/run.sh)\" -- 关卡文件夹名"
  exit 1
fi

level="$1"

case "$level" in
  ""|/*|*..*|*/*)
    echo "关卡名称不合法: $level"
    exit 1
    ;;
esac

workdir="$(mktemp -d)"
cleanup() {
  rm -rf "$workdir"
}
trap cleanup EXIT

archive="$workdir/czxt-main.zip"

if command -v curl >/dev/null 2>&1; then
  curl -fL "$REPO_ZIP_URL" -o "$archive"
elif command -v wget >/dev/null 2>&1; then
  wget -O "$archive" "$REPO_ZIP_URL"
else
  echo "当前系统缺少 curl 或 wget，无法下载文件。"
  exit 1
fi

if ! command -v unzip >/dev/null 2>&1; then
  echo "当前系统缺少 unzip，无法解压 GitHub 下载包。"
  exit 1
fi

unzip -q "$archive" -d "$workdir"

level_dir="$workdir/czxt-main/$level"
if [ ! -d "$level_dir" ]; then
  echo "没有找到关卡目录: $level"
  echo "请确认关卡名称和 GitHub 仓库中的文件夹名称完全一致。"
  exit 1
fi

if [ ! -f "$level_dir/install.sh" ]; then
  echo "关卡目录中缺少 install.sh: $level"
  exit 1
fi

cd "$level_dir"
bash install.sh
