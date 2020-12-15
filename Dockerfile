FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Split of Linuxserver.io version: ${VERSION} Build-date: ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment settings
ARG MONO_VERSION="6.12.0.107"

RUN \
 echo "**** Install Build Packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	libgcc \
  gcc \
  g++ \
  make \
  python3 \
  autoconf \
  automake \
  libtool \
  musl-dev \
  cmake \
  linux-headers \
  gdb \
  strace \
  git \
  linux-headers && \
 echo "**** Dowload and build mono ****" && \
 git clone https://github.com/mono/mono.git /tmp/mono && \
 cd /tmp/mono && \
 ./autogen.sh \
	--prefix=/usr/local \
	--with-mcs-docs=no \
	--with-sigaltstack=no \
	--disable-nls && \
 sed -i 's/HAVE_DECL_PTHREAD_MUTEXATTR_SETPROTOCOL/0/' \
	mono/utils/mono-os-mutex.h && \
 make -j16 && \
 make install && \
 echo "**** Cleanup ****" && \
 cd .. && \
 apk del --purge \
 build-dependencies && \
 rm -rf \
	mono-master \
	/usr/lib/*.la \
  /tmp/* \
  /root/.cache \
	/usr/lib/mono/*/Mono.Security.Win32* \
	/usr/lib/libMonoSupportW.*
