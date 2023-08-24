#!/usr/bin/env bash
if [[ "$#" -lt 1 ]]; then
  echo "$0 [example.wat] ..."
  exit 1
fi

run_wat() {
  local F=${1%%.wat}
  ( set -x; wat2wasm $F.wat -o $F.wasm )
  docker run -it --rm -v .:/app wasmedge/slim:0.13.3 wasmedge compile $F.wasm $F.so
  docker run -it --rm -v .:/app wasmedge/slim:0.13.3 wasmedge $F.so
}

for arg in "$@"; do
  run_wat $arg
  echo "exit: $?"
done
