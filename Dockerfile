FROM vcxpz/baseimage-alpine

RUN set -xe && \
   echo "**** install runtime packages ****" && \
   apk add --no-cache \
      ca-certificates-mono \
      mono-runtime \
      sqlite-libs && \
   update-ca-certificates && \
   echo "**** cleanup ****" && \
   rm -rf \
      /tmp/*
