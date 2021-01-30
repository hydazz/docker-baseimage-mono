ARG TAG
FROM vcxpz/baseimage-alpine:${TAG}

RUN \
	echo "**** install runtime packages ****" && \
	apk add --no-cache \
		ca-certificates-mono \
		mono-runtime \
		sqlite-libs && \
	mono --version || exit 1 && \
	update-ca-certificates && \
	echo "**** cleanup ****" && \
	rm -rf \
		/tmp/*
