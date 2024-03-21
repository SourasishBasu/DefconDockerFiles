FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir -p /run/sshd \
  && chmod 755 /run/sshd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN useradd -ms /bin/bash anon
RUN echo "anon:anon" | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
