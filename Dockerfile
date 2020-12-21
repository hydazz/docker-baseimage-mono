FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Fork of Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Alex Hyde"

RUN \
 echo "**** install curl ****" && \
 apk add --no-cache \
	curl && \
 curl https://alpine.spritsail.io/spritsail-alpine.rsa.pub -o /etc/apk/keys/spritsail-alpine.rsa.pub && \
 echo "https://alpine.spritsail.io/mono" >>/etc/apk/repositories && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
     libmediainfo \
     sqlite-libs \
     mono-runtime \
     ca-certificates-mono && \
 update-ca-certificates && \
 echo "**** cleanup ****" && \
 apk del \
     ca-certificates-mono && \
 rm -rf \
     /tmp/*
