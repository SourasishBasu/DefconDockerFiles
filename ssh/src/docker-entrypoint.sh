#!/bin/sh

ssh-keygen -A

touch /var/run/utmp 

adduser \
	-D \
	-h /home/anon \
	-s /bin/bash \
	-G shadow \
	anon

echo "This is a test file for anon" > /home/anon/test.txt
echo 'anon:changethis' | chpasswd 
chown -R anon /home/anon 
chmod -R 500 /home/anon 
chmod 700 /home/anon 

adduser \
	-D \
	-h /home/ecorp \
	-s /bin/bash \
	-G shadow \
	ecorp
echo "This is a test file for ecorp" > /home/ecorp/test.txt
echo 'ecorp:changethis' | chpasswd 
chown -R ecorp /home/ecorp 
chmod -R 500 /home/ecorp 
chmod 700 /home/ecorp 

chmod u+s /bin/su

/usr/sbin/sshd -D