FROM debian:trixie-slim

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	nano \
    openssh-server \
    net-tools \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    acl \
    software-properties-common \
    apt-transport-https \
    ca-certificates \ 
    ncurses-term \
    dkms \
    curl 

RUN mkdir /custom

ADD ["./data/gen.sh","/custom/"]
ADD ["./data/acc-gen.py","/custom/"]
ADD ["./data/pass-mod.py","/custom/"]
ADD ["./data/passwords.csv","/custom/"]
ADD ["./data/usernames.csv","/custom/"]
ADD ["./data/protecc.py","/custom/"]
ADD ["./data/paths.txt","/custom/"]

ADD ["/src/mod-ssh-entrypoint.sh", "/"]

RUN chmod +x /mod-ssh-entrypoint.sh
ENTRYPOINT [ "/mod-ssh-entrypoint.sh" ]

EXPOSE 22/tcp

HEALTHCHECK --interval=5m --timeout=5s \
	CMD netstat -lnt | grep :22 || exit 1
