# syntax = edrevo/dockerfile-plus
INCLUDE+ ./docker/base.Dockerfile

ARG version=0.11.2
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh \
  | bash -s -- -p /usr/local -v $version

CMD ["zx", "--quiet", "./run.mjs", "./runners/wasmedge.mjs"]
