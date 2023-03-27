FROM node:lts

RUN npm i -g zx

WORKDIR /wasmmark
COPY ./libsodium-tests /wasmmark/libsodium-tests
COPY ./scripts /wasmmark

ENV REPEAT=1
CMD ["zx", "--quiet", "./run.mjs", "./runners/node.mjs"]
