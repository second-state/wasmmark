# WasmMark

Run WebAssembly benchmarks and report differences between versions.

* Files in [libsodium-tests](libsodium-tests) are from [webassembly-benchmarks](https://github.com/jedisct1/webassembly-benchmarks)/2022-12.

## Build Dockerfiles

```sh
docker build -t "wasmmark:node" -f docker/node.Dockerfile .
docker build --build-arg version=0.11.2 -t "wasmmark:wasmedge-0.11.2" -f docker/wasmedge.Dockerfile .
docker build --build-arg commitish=master -t "wasmmark:wasmedge-latest" -f docker/wasmedge-src.Dockerfile .
```

## Future Work

* Unify environment in all dockerfiles:

    Only [docker/wasmedge-src.Dockerfile](wasmedge-src.Dockerfile) is based on `wasmedge/wasmedge:latest`.

* Add error handling:

    One failed benchmark will cause NO result.
