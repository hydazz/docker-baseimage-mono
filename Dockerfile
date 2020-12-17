FROM vcxpz/baseimage-alpine

RUN \
 echo "**** Install Packages ****" && \
 apk add --no-cache \
	curl \
  icu-libs \
  jq \
  libcurl \
  libgcc \
  libmediainfo \
  libstdc++ \
  libzen \
  nghttp2-libs \
  oniguruma \
  sqlite-libs \
  tinyxml2 && \
 apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
	mono \
  mono-dev
