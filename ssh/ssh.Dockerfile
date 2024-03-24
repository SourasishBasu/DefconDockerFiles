FROM alpine:latest

RUN apk add --no-cache --update \
	nano \
    openssh \
    bash 

ADD [ "/src/sshd_config", "/etc/ssh/sshd_config" ]
ADD ["/src/docker-entrypoint.sh", "/"]

RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]

EXPOSE 22/tcp
HEALTHCHECK --interval=5m --timeout=5s \
	CMD netstat -lnt | grep :22 || exit 1

