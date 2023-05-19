FROM wasmedge/wasmedge:latest
ARG commitish=master

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
  apt install -y nodejs
RUN rm -rf /var/lib/apt/lists/*

RUN npm i -g zx

WORKDIR /wasmmark
COPY ./libsodium-tests /wasmmark/libsodium-tests
COPY ./scripts /wasmmark

WORKDIR /
RUN git clone https://github.com/WasmEdge/WasmEdge.git

WORKDIR /WasmEdge
RUN git checkout $commitish
RUN mkdir -p build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && make -j install

RUN echo $(git rev-parse --verify --short HEAD) $(date)

WORKDIR /wasmmark
ENV REPEAT=1
CMD ["zx", "--quiet", "./run.mjs", "./runners/wasmedge.mjs"]
