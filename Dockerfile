FROM vcxpz/baseimage-alpine

RUN set -xe && \
   echo "**** install runtime packages ****" && \
   apk add --no-cache \
      libmediainfo \
      sqlite-libs \
      mono-runtime \
      ca-certificates-mono && \
   update-ca-certificates && \
   echo "**** cleanup ****" && \
   rm -rf \
      /tmp/*
