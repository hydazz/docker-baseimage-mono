FROM vcxpz/baseimage-alpine

RUN set -xe && \
   echo "**** install runtime packages ****" && \
   apk add --no-cache \
      mono-runtime \
      ca-certificates-mono && \
   update-ca-certificates && \
   echo "**** cleanup ****" && \
   rm -rf \
      /tmp/*
