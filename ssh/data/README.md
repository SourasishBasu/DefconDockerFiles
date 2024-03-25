    groupadd -g 1000 bots

    useradd -ms /bin/bash ecorp && \
    echo 'ecorp:changethis' | chpasswd --crypt-method=SHA512 && \
    chown -R ecorp:ecorp /home/ecorp && \
    chmod -R 500 /home/ecorp && \
    chmod 700 /home/ecorp

    chmod u+s /usr/bin/su

    mkdir -p /run/sshd && chmod 755 /run/sshd

    touch /var/run/utmp 

    /usr/sbin/sshd 

    python3 acc-gen.py
