FROM vcxpz/baseimage-alpine

RUN \
 echo "**** Install Packages ****" && \
 apk add --no-cache \
	mediainfo \
	sqlite && \
 apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
	mono
