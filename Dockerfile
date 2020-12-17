FROM vcxpz/baseimage-alpine

RUN \
 echo "**** Install Packages ****" && \
 apk add --no-cache \
	curl \
	icu-libs \
	libintl \
	libmediainfo \
	sqlite-libs && \
 apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
	mono
