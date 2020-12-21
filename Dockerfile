FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Fork of Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Alex Hyde"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies --upgrade \
	curl \
     ca-certificates-mono && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
     libmediainfo \
     sqlite-libs && \
 curl https://alpine.spritsail.io/spritsail-alpine.rsa.pub -o /etc/apk/keys/spritsail-alpine.rsa.pub && \
 apk add --no-cache --repository https://alpine.spritsail.io/mono \
     mono-runtime && \
 update-ca-certificates && \
 echo "**** cleanup ****" && \
 apk del --purge \
 build-dependencies && \
     rm -rf \
     /tmp/*
