FROM vcxpz/baseimage-alpine

RUN \
 echo "**** install packages ****" && \
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
