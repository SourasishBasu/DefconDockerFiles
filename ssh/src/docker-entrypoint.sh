#!/bin/sh

adduser \
	-D \
	-h /home/anon \
	-s /bin/bash \
	-G shadow \
	anon

echo "This is a test file" > /home/anon/test.txt
echo 'anon:changethis' | chpasswd 
chown -R anon /home/anon 
chmod -R 500 /home/anon 
chmod 700 /home/anon 
chmod 711 /bin/su

adduser \
	-D \
	-h /home/ecorp \
	-s /bin/bash \
	ecorp
echo "This is a test file" > /home/ecorp/test.txt
echo 'ecorp:changethis' | chpasswd 
chown -R ecorp:ecorp /home/ecorp 
chmod -R 500 /home/ecorp 
chmod 700 /home/ecorp 

chmod u+s /usr/bin/su

/usr/sbin/sshd -D