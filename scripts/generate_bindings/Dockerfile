FROM alpine:3.17

RUN apk add \
  clang15-dev \
  crystal \
  git \
  llvm15-dev \
  make \
  shards \
  yaml-dev

WORKDIR /libgen
RUN git clone --branch v0.2.11 --depth 1 https://github.com/olbat/libgen .
RUN make install -j $(nproc)

WORKDIR /grok.cr
COPY . .
RUN libgen
