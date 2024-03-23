#!/bin/sh

addgroup \
	-g $GID \
	-S \
	user

adduser \
	-D \
	-G user \
	-h /home/user \
	-s /bin/false \
	-u $UID \
	user

mkdir -p /home/user
echo "This is a test file" > /home/user/test.txt
chown -R user:user /home/user
chmod -R 755 /home/user
echo "user:123" | /usr/sbin/chpasswd

/usr/bin/supervisord -c /etc/supervisord.conf