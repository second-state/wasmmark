# WasmMark

Run WebAssembly benchmarks and report differences between versions.

* Files in [libsodium-tests](libsodium-tests) are from [webassembly-benchmarks](https://github.com/jedisct1/webassembly-benchmarks)/2022-12.

## Build Dockerfiles

```sh
docker build -t "wasmmark:node" -f docker/node.Dockerfile .
docker build --build-arg version=0.11.2 -t "wasmmark:wasmedge" -f docker/wasmedge.Dockerfile .
```
