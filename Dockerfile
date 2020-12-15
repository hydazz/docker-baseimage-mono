FROM vcxpz/baseimage-alpine

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	bzip2 \
	libcurl \
	mediainfo \
	python3 \
	sqlite \
	unzip && \
 apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
	mono
