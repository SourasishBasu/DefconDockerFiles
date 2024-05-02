FROM alpine:latest

RUN apk add --no-cache --update \
	nano \
    openssh \
    bash \
    shadow \
    procps

ADD [ "/src/sshd_config", "/etc/ssh/sshd_config" ]
ADD ["/src/alpine-docker-entrypoint.sh", "/"]

RUN chmod +x /alpine-docker-entrypoint.sh
ENTRYPOINT [ "/alpine-docker-entrypoint.sh" ]

EXPOSE 22/tcp
HEALTHCHECK --interval=5m --timeout=5s \
	CMD netstat -lnt | grep :22 || exit 1

