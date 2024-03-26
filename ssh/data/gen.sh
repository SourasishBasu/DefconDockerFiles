#!/bin/bash

if [ -z "$1" ]
then
    echo "No username provided. Usage: ./gen.sh <username>"
    exit 1
fi

USERNAME=$1

useradd -ms /bin/bash $USERNAME && \
    echo "$USERNAME:12345" | chpasswd && \
    chown -R $USERNAME:$USERNAME /home/$USERNAME && \
    chmod -R 500 /home/$USERNAME && \
    chmod 700 /home/$USERNAME && \

usermod -aG shadow,bots $USERNAME