#!/bin/sh

mkdir -p /run/sshd && chmod 755 /run/sshd

touch /var/run/utmp 

useradd -ms /bin/bash anon && \
  echo 'anon:changethis' | chpasswd && \
  chown -R anon:anon /home/anon && \
  chmod -R 500 /home/anon && \
  chmod 700 /home/anon && \
  chmod 711 /bin/su

useradd -ms /bin/bash ecorp && \
  echo 'ecorp:changethis' | chpasswd --crypt-method=SHA512 && \
  chown -R ecorp:ecorp /home/ecorp && \
  chmod -R 500 /home/ecorp && \
  chmod 700 /home/ecorp

chmod u+s /usr/bin/su
chmod 700 deb-docker-entrypoint.sh

usermod -aG shadow anon

/usr/sbin/sshd -D