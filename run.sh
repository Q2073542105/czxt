#!/bin/bash
set -e

RAW_BASE="${CZXT_RAW_BASE:-https://cdn.jsdelivr.net/gh/Q2073542105/czxt@main}"

if [ $# -lt 1 ]; then
  echo "用法: bash -c \"$(curl -fsSL https://cdn.jsdelivr.net/gh/Q2073542105/czxt@main/run.sh)\" -- 关卡文件夹名"
  exit 1
fi

level="$1"

case "$level" in
  4.1.kehou-1)
    level_path="4.1.kehou-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第三关.txt|%E7%AC%AC%E4%B8%89%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  4.1.kehou-2)
    level_path="4.1.kehou-2"
    files="$(cat <<'FILES'
install.sh|install.sh
第四关.txt|%E7%AC%AC%E5%9B%9B%E5%85%B3.txt
dbg.log|dbg.log
FILES
)"
    ;;
  4.1.kehou-3)
    level_path="4.1.kehou-3"
    files="$(cat <<'FILES'
install.sh|install.sh
第五关.txt|%E7%AC%AC%E4%BA%94%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  4.1.ketang-1)
    level_path="4.1.ketang-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第一关.txt|%E7%AC%AC%E4%B8%80%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  4.1.ketang-2)
    level_path="4.1.ketang-2"
    files="$(cat <<'FILES'
install.sh|install.sh
第二关.txt|%E7%AC%AC%E4%BA%8C%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  4.3.kehou-1)
    level_path="4.3.kehou-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第三关.txt|%E7%AC%AC%E4%B8%89%E5%85%B3.txt
dbg.log|dbg.log
gdb.log|gdb.log
FILES
)"
    ;;
  4.3.kehou-2)
    level_path="4.3.kehou-2"
    files="$(cat <<'FILES'
install.sh|install.sh
main.c|main.c
memory.c|memory.c
FILES
)"
    ;;
  4.3.ketang-1)
    level_path="4.3.ketang-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第一关.txt|%E7%AC%AC%E4%B8%80%E5%85%B3.txt
dbg.log|dbg.log
gdb.log|gdb.log
FILES
)"
    ;;
  4.3.ketang-2)
    level_path="4.3.ketang-2"
    files="$(cat <<'FILES'
install.sh|install.sh
第二关.txt|%E7%AC%AC%E4%BA%8C%E5%85%B3.txt
dbg.log|dbg.log
gdb.log|gdb.log
FILES
)"
    ;;
  4.4.kehou-1)
    level_path="4.4.kehou-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第三关.txt|%E7%AC%AC%E4%B8%89%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  4.4.kehou-2)
    level_path="4.4.kehou-2"
    files="$(cat <<'FILES'
install.sh|install.sh
第四关.txt|%E7%AC%AC%E5%9B%9B%E5%85%B3.txt
dbg.log|dbg.log
gdb.log|gdb.log
FILES
)"
    ;;
  4.4.ketang-1)
    level_path="4.4.ketang-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第一关.txt|%E7%AC%AC%E4%B8%80%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  4.4.ketang-2)
    level_path="4.4.ketang-2"
    files="$(cat <<'FILES'
install.sh|install.sh
第二关.txt|%E7%AC%AC%E4%BA%8C%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  5.kehou)
    level_path="5.kehou"
    files="$(cat <<'FILES'
install.sh|install.sh
4-1.c|4-1.c
4-2.c|4-2.c
4-3.c|4-3.c
FILES
)"
    ;;
  6.1.kehou-1)
    level_path="6.1.kehou-1"
    files="$(cat <<'FILES'
install.sh|install.sh
mycat.c|mycat.c
FILES
)"
    ;;
  6.1.kehou-2)
    level_path="6.1.kehou-2"
    files="$(cat <<'FILES'
install.sh|install.sh
第四关.txt|%E7%AC%AC%E5%9B%9B%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  6.1.ketang-1)
    level_path="6.1.ketang-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第一关.txt|%E7%AC%AC%E4%B8%80%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  6.1.ketang-2)
    level_path="6.1.ketang-2"
    files="$(cat <<'FILES'
install.sh|install.sh
第二关.txt|%E7%AC%AC%E4%BA%8C%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  6.2.ketang)
    level_path="6.2.ketang"
    files="$(cat <<'FILES'
install.sh|install.sh
0.gdb-1|0.gdb-1
0.gdb-2|0.gdb-2
0.gdb-3|0.gdb-3
第二关.txt|%E7%AC%AC%E4%BA%8C%E5%85%B3.txt
第三关.txt|%E7%AC%AC%E4%B8%89%E5%85%B3.txt
第一关.txt|%E7%AC%AC%E4%B8%80%E5%85%B3.txt
pass1.sh|pass1.sh
pass2.sh|pass2.sh
pass3.sh|pass3.sh
FILES
)"
    ;;
  7.1.kehou-1)
    level_path="7.1.kehou-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第三关.txt|%E7%AC%AC%E4%B8%89%E5%85%B3.txt
第四关.txt|%E7%AC%AC%E5%9B%9B%E5%85%B3.txt
history3.log|history3.log
history4.log|history4.log
FILES
)"
    ;;
  7.1.kehou-2)
    level_path="7.1.kehou-2"
    files="$(cat <<'FILES'
install.sh|install.sh
第三关.txt|%E7%AC%AC%E4%B8%89%E5%85%B3.txt
第四关.txt|%E7%AC%AC%E5%9B%9B%E5%85%B3.txt
history3.log|history3.log
history4.log|history4.log
FILES
)"
    ;;
  7.1.ketang-1)
    level_path="7.1.ketang-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第二关.txt|%E7%AC%AC%E4%BA%8C%E5%85%B3.txt
第一关.txt|%E7%AC%AC%E4%B8%80%E5%85%B3.txt
gdb.log|gdb.log
history1.log|history1.log
history2.log|history2.log
FILES
)"
    ;;
  7.2.kehou-1)
    level_path="7.2.kehou-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第三关.txt|%E7%AC%AC%E4%B8%89%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  7.2.kehou-2)
    level_path="7.2.kehou-2"
    files="$(cat <<'FILES'
install.sh|install.sh
第五关.txt|%E7%AC%AC%E4%BA%94%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  7.2.ketang-1)
    level_path="7.2.ketang-1"
    files="$(cat <<'FILES'
install.sh|install.sh
第一关.txt|%E7%AC%AC%E4%B8%80%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  7.2.ketang-2)
    level_path="7.2.ketang-2"
    files="$(cat <<'FILES'
install.sh|install.sh
第二关.txt|%E7%AC%AC%E4%BA%8C%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  7.3.ketang-3)
    level_path="7.3.ketang-3"
    files="$(cat <<'FILES'
install.sh|install.sh
第四关.txt|%E7%AC%AC%E5%9B%9B%E5%85%B3.txt
gdb.log|gdb.log
FILES
)"
    ;;
  *)
    echo "没有找到关卡: $level"
    echo "请确认关卡名称和 GitHub 仓库中的文件夹名称完全一致。"
    exit 1
    ;;
esac

workdir="$(mktemp -d)"
cleanup() {
  rm -rf "$workdir"
}
trap cleanup EXIT

level_dir="$workdir/$level"
mkdir -p "$level_dir"

download_file() {
  local name="$1"
  local encoded_name="$2"
  local url="$RAW_BASE/$level_path/$encoded_name"
  local target="$level_dir/$name"

  echo "下载: $level/$name"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL --retry 3 --connect-timeout 15 "$url" -o "$target"
  elif command -v wget >/dev/null 2>&1; then
    wget -q -O "$target" "$url"
  else
    echo "当前系统缺少 curl 或 wget，无法下载文件。"
    exit 1
  fi
}

while IFS='|' read -r name encoded_name; do
  if [ -n "$name" ]; then
    download_file "$name" "$encoded_name"
  fi
done <<EOF
$files
EOF

if [ ! -f "$level_dir/install.sh" ]; then
  echo "关卡目录中缺少 install.sh: $level"
  exit 1
fi

cd "$level_dir"
bash install.sh
