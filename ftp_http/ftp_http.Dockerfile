FROM alpine:latest
ENV FTP_USER=foo \
	FTP_PASS=bar \
	GID=1000 \
	UID=1000

RUN apk add --no-cache --update \
	vsftpd \
	apache2 \
	bash \
    curl \
    wget \
    neofetch \
    supervisor \
    nano

ADD [ "/src/vsftpd.conf", "/etc" ]

ADD ["/src/httpd.conf","/etc/apache2/httpd.conf"]

ADD ["/src/supervisord.conf","/etc"]

ADD [ "/src/docker-entrypoint.sh", "/" ]

RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]

EXPOSE 20/tcp 21/tcp 40000-40050/tcp 80/tcp
HEALTHCHECK --interval=5m --timeout=5s \
	CMD netstat -lnt | grep :21 && netstat -lnt | grep :80 || exit 1
