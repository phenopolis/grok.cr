FROM alpine:latest

RUN apk add \
  build-base \
  cmake \
  crystal \
  git \
  highway-dev \
  lcms2-dev \
  libjpeg-turbo-static \
  nasm

RUN rm \
  /lib/libz.so \
  /usr/lib/libjpeg.so \
  /usr/lib/libwebp.so

RUN git clone --depth 1 https://github.com/GrokImageCompression/grok.git
WORKDIR /grok
RUN cmake \
  -B build \
  -DBUILD_SHARED_LIBS=OFF \
  -DCMAKE_EXE_LINKER_FLAGS="-static" \
  .
RUN make \
  -C build \
  -j $(nproc) \
  install

WORKDIR /grok.cr
COPY . .
RUN crystal build \
  --no-debug \
  --release \
  --static \
  examples/decompress.cr
