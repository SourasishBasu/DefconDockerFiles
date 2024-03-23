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
