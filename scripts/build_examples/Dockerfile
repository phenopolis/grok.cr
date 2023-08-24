FROM alpine:3.17

RUN apk add \
  build-base \
  cmake \
  crystal \
  git \
  libjpeg-turbo-dev \
  libjpeg-turbo-static \
  yasm

RUN rm /usr/lib/libjpeg.so

WORKDIR /grok
RUN git clone --branch v10.0.8 --depth 1 https://github.com/GrokImageCompression/grok.git .
RUN cmake \
  -B build \
  -DBUILD_SHARED_LIBS=OFF \
  -DCMAKE_EXE_LINKER_FLAGS="-static" \
  -DGRK_BUILD_CODEC=OFF \
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
