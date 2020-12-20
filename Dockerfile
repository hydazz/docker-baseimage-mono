FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Fork of Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Alex Hyde"

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	curl \
     jq \
     icu-libs \
     libcurl \
     libgcc \
     libmediainfo \
     sqlite-libs && \
 apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
	mono && \
 echo "**** fix mono certs ****" && \
 cert-sync /etc/ssl/certs/ca-certificates.crt
