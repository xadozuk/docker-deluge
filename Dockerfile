FROM phusion/baseimage

MAINTAINER Xadozuk <xadozuk@gmail.com>

RUN add-apt-repository ppa:deluge-team/ppa && \
    apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y deluged deluge-webui && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY deluge	/tmp/deluge
COPY my_init.d 	/etc/my_init.d
COPY service 	/etc/service

RUN	mkdir -p /deluge/deluged /deluge/deluge-web /downloads 
	# adduser -Ss /bin/sh deluge && \
	# chown -R deluge /deluge /downloads

EXPOSE 8080

VOLUME ["/deluge", "/downloads"]

CMD ["/sbin/my_init"]
