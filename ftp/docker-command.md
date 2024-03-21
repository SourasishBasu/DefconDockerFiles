```
docker run `
    -itd `
    --env FTP_PASS=123 `
    --env FTP_USER=user `
    --name ftp-server `
    --publish 20-21:20-21/tcp `
    --publish 40000-40050:40000-40050/tcp `
    --volume /d/Github/testing/ftp/data:/home/user `
    vsftpd-srv
```