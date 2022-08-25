FROM alpine:latest

RUN apk add \
  build-base \
  cmake \
  crystal \
  git \
  nasm

WORKDIR /libjpeg-turbo
RUN git clone --branch 2.0.x --depth 1 https://github.com/libjpeg-turbo/libjpeg-turbo .
RUN cmake \
  -B build \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DENABLE_SHARED=OFF \
  -DENABLE_STATIC=ON \
  .
RUN make -C build -j$(nproc) install

WORKDIR /grok
RUN git clone --depth 1 https://github.com/GrokImageCompression/grok.git .
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
