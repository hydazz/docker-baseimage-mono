FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Fork of Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Alex Hyde"

RUN \
   echo "**** install build packages ****" && \
   apk add --no-cache --virtual=build-dependencies \
      curl && \
   curl -o \
      /etc/apk/keys/hydaz.rsa.pub \
      "https://hydenet.work/alpine/hydaz.rsa.pub" && \
   echo "**** install runtime packages ****" && \
   apk add --no-cache \
      libmediainfo \
      sqlite-libs && \
   apk add --update --no-cache --repository https://hydenet.work/alpine/ \
      mono-runtime \
      ca-certificates-mono && \
   update-ca-certificates && \
   echo "**** cleanup ****" && \
   apk del --purge \
      build-dependencies && \
   rm -rf \
      /tmp/*
