FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir -p /run/sshd \
  && chmod 755 /run/sshd

RUN useradd -ms /bin/bash anon && \
  echo 'anon:changethispassword' | chpasswd && \
  chown -R anon:anon /home/anon && \
  chmod -R 500 /home/anon && \
  chmod 700 /home/anon && \
  chmod 711 /bin/su

RUN useradd -ms /bin/bash ecorp && \
  echo 'ecorp:changethispassword' | chpasswd && \
  chown -R ecorp:ecorp /home/ecorp && \
  chmod -R 500 /home/ecorp && \
  chmod 700 /home/ecorp

RUN chmod u+s /usr/bin/su

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
