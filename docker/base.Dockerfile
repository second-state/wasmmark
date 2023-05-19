FROM node:lts as base
RUN npm i -g zx

WORKDIR /wasmmark
COPY ./libsodium-tests /wasmmark/libsodium-tests
COPY ./scripts /wasmmark

ENV REPEAT=1
