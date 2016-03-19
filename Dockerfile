FROM alpine:3.2

MAINTAINER Xadozuk <xadozuk@gmail.com>

# TODO: http://dev.deluge-torrent.org/changeset/d40dfcd53c243

ENV PACKAGES "supervisor py-enum34 deluge"

RUN apk add --update --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
	$PACKAGES

COPY supervisord.ini /etc/supervisor.d/supervisord.ini
COPY deluge /deluge

RUN rm -rf /var/cache/apk/* && \
	# adduser -Ss /bin/sh deluge && \
	mkdir -p /deluge/deluged /deluge/deluge-web /downloads 
	# chown -R deluge /deluge /downloads

EXPOSE 8080

VOLUME ["/deluge", "/downloads"]

CMD ["/usr/bin/supervisord"]
