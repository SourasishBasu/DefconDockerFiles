#!/bin/bash

groupadd -g 2000 bots

useradd -ms /bin/bash ecorp && \
 echo 'ecorp:changethis' | chpasswd --crypt-method=SHA512 && \
 chown -R ecorp:ecorp /home/ecorp && \
 chmod -R 500 /home/ecorp && \
 chmod 700 /home/ecorp && \ 
 echo "ftp 68.183.82.101 anonymous http://68.183.82.101/" >> /home/ecorp/root.txt && \ 
 touch /home/ecorp/.bash_history && \
 chown ecorp:ecorp /home/ecorp/root.txt && \
 chmod 400 /home/ecorp/root.txt

mkdir -p /run/sshd && chmod 755 /run/sshd

touch /var/run/utmp 

chmod u+s /usr/bin/su
chmod 700 /usr/bin/passwd
chmod 700 -R /custom
chmod 700 /mod-ssh-entrypoint.sh
chmod 500 -R /home/ecorp

python3 custom/acc-gen.py
python3 custom/pass-mod.py
python3 custom/protecc.py

/usr/sbin/sshd -D