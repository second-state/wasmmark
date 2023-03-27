FROM node:lts
ARG version=0.11.2

RUN npm i -g zx
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh \
  | bash -s -- -p /usr/local -v $version

WORKDIR /wasmmark
COPY ./libsodium-tests /wasmmark/libsodium-tests
COPY ./scripts /wasmmark

ENV REPEAT=1
CMD ["zx", "--quiet", "./run.mjs", "./runners/wasmedge.mjs"]
