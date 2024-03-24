FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server net-tools

RUN mkdir -p /run/sshd \
  && chmod 755 /run/sshd

RUN sed -i 's/#MaxSessions 10/MaxSessions 300/' /etc/ssh/sshd_config \
  && sed -i 's/#MaxStartups 10:30:100/MaxStartups 50:30:100/' /etc/ssh/sshd_config \
  && sed -i 's/#TCPKeepAlive yes/TCPKeepAlive yes/' /etc/ssh/sshd_config \
  && sed -i 's/#ClientAliveInterval 0/ClientAliveInterval 180/' /etc/ssh/sshd_config \
  && sed -i 's/#ClientAliveCountMax 3/ClientAliveCountMax 3/' /etc/ssh/sshd_config \
  && sed -i 's/#LoginGraceTime 2m/LoginGraceTime 1m/' /etc/ssh/sshd_config

RUN useradd -ms /bin/bash anon && \
  echo 'anon:changethis' | chpasswd && \
  chown -R anon:anon /home/anon && \
  chmod -R 500 /home/anon && \
  chmod 700 /home/anon && \
  chmod 711 /bin/su

RUN useradd -ms /bin/bash ecorp && \
  echo 'ecorp:changethis' | chpasswd --crypt-method=SHA512 && \
  chown -R ecorp:ecorp /home/ecorp && \
  chmod -R 500 /home/ecorp && \
  chmod 700 /home/ecorp

RUN chmod u+s /usr/bin/su

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
