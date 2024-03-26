FROM debian:trixie-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
	nano \
    openssh-server \
    net-tools \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    acl

RUN mkdir /custom

ADD ["./data/gen.sh","/custom/"]
ADD ["./data/acc-gen.py","/custom/"]
ADD ["./data/pass-gen.py","/custom/"]
ADD ["./data/usernames.csv","/custom/"]

ADD ["/src/mod-ssh-entrypoint.sh", "/"]

RUN chmod +x /mod-ssh-entrypoint.sh
ENTRYPOINT [ "/mod-ssh-entrypoint.sh" ]

EXPOSE 22/tcp

HEALTHCHECK --interval=5m --timeout=5s \
	CMD netstat -lnt | grep :22 || exit 1
