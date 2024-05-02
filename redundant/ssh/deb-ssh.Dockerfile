FROM debian:trixie-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
	nano \
    openssh-server \
    net-tools

ADD [ "/src/sshd_config", "/etc/ssh/sshd_config" ]
ADD ["/src/deb-docker-entrypoint.sh", "/"]

RUN chmod +x /deb-docker-entrypoint.sh
ENTRYPOINT [ "/deb-docker-entrypoint.sh" ]

EXPOSE 22/tcp

HEALTHCHECK --interval=5m --timeout=5s \
	CMD netstat -lnt | grep :22 || exit 1

