FROM node:lts

RUN npm i -g zx

WORKDIR /wasmmark
COPY ./libsodium-tests /wasmmark/libsodium-tests
COPY ./scripts /wasmmark

CMD ["zx", "--quiet", "./runner.mjs", "./node.mjs"]
