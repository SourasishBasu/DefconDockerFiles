FROM alpine:latest
ENV FTP_USER=foo \
	FTP_PASS=bar \
	GID=1000 \
	UID=1000

RUN apk add --no-cache --update \
	vsftpd 
	# man \
	# ufw 

ADD [ "/src/vsftpd.conf", "/etc" ]
ADD [ "/src/docker-entrypoint.sh", "/" ]
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
EXPOSE 20/tcp 21/tcp 40000-40009/tcp
HEALTHCHECK --interval=5m --timeout=5s \
	CMD netstat -lnt | grep :21 || exit 1
