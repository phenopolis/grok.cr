FROM alpine:latest

RUN apk add \
  build-base \
  cmake \
  crystal \
  git \
  nasm

RUN git clone --depth 1 https://github.com/GrokImageCompression/grok.git
WORKDIR /grok
RUN cmake \
  -B build \
  -DBUILD_SHARED_LIBS=OFF \
  -DCMAKE_EXE_LINKER_FLAGS="-static" \
  .
RUN make -C build -j $(nproc)

WORKDIR /grok.cr
COPY . .
RUN CRYSTAL_LIBRARY_PATH=/grok/build/bin:$CRYSTAL_LIBRARY_PATH \
  crystal build \
  --no-debug \
  --release \
  --static \
  examples/decompress.cr
