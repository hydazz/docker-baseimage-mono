FROM vcxpz/baseimage-alpine

ARG mono_version=6.12.0.107

RUN \
 echo "**** Install Build Packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
  gcc \
  g++ \
  make \
  python3 \
  xz \
  autoconf \
  automake \
  libtool \
  musl-dev \
  cmake \
  linux-headers \
  gdb \
  strace \
  linux-headers \
  curl \
  git && \
 echo "**** Install Runtime Packages ****" && \
 apk add --no-cache \
  mediainfo \
  sqlite && \
 echo "**** Dowload and build mono ****" && \
 mkdir /build && \
 cd /build && \
 git clone https://github.com/mono/mono.git && \
 cd /build/mono && \
 git submodule update --init --recursive && \
 git fetch && git checkout mono-${mono_version} && git submodule update --init --recursive && \
 ./autogen.sh \
  --prefix=/usr/local \
  --with-mcs-docs=no \
  --with-sigaltstack=no \
  --disable-nls && \
 ln -s /usr/bin/python3 /usr/bin/python && \
 sed -i 's/HAVE_DECL_PTHREAD_MUTEXATTR_SETPROTOCOL/0/' \
  mono/utils/mono-os-mutex.h && \
 make -j16 && \
 make install && \
 echo "**** Cleanup ****" && \
 apk del --purge \
	build-dependencies \
 rm -rf \
  /usr/local/include \
  /usr/lib/*.la \
  /usr/lib/mono/*/Mono.Security.Win32* \
  /usr/lib/libMonoSupportW.* \
  /build && \
 find /usr/local -name \*.a | xargs rm
