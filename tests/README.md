# Tests

## [Memory](memory/)

| Filename | Description | Expected Result |
| -------- | ----------- | --------------- |
| [just-in-bound.wat] | start w/ 1 memory page; store an `i32` at addr `65532` | suceeds w/ exit status `0` |
| [out-of-bound.wat] | start w/ 1 memory page; store an `i32` at addr `65533` | fails w/ `out of bounds memory access` |
| [wellgrown.wat] | limit at 2 memory pages; start w/ 1 page and grow by 1 page | returns `1` |
| [overgrown.wat] | limit at 2 memory pages; start w/ 1 page and grow by 2 pages | returns `4294967295` (`-1` in `u32`) |

[just-in-bound.wat]: memory/just-in-bound.wat
[out-of-bound.wat]: memory/out-of-bound.wat
[wellgrown.wat]: memory/wellgrown.wat
[overgrown.wat]: memory/overgrown.wat

## Running

Convert `.wat` to `.wasm` and run with [WasmEdge 0.13.3](https://hub.docker.com/r/wasmedge/slim/tags?name=0.13.3).

```
./run.sh [example.wat] ...
```

### Limit Memory Pages via WasmEdge CLI

Run a wasm app that asks for 2 pages of memory with `--memory-page-limit 1`.

```
docker run -it --rm -v .:/app wasmedge/slim:0.13.3 wasmedge --memory-page-limit 1 memory/wellgrown.wasm
```

Example output for the above commands.

```
[2023-08-24 13:09:45.216] [error] Memory grow page failed -- exceeded limit page size: 1
4294967295
```

## Notes

- `wat2wasm` version `1.0.13`
