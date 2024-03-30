# Defcon Dockerfiles

To build:

```bash
docker build -t container-image-name .
```

To SSH:
```bash
ssh -p <host-port> <username>@host-ip
```

To enter Docker container as root:
```bash
docker exec -u 0 -it <container-name> /bin/bash
```

To enter EC2 machine:
`cd` into folder containing `.pem` file to access instance
```bash
ssh -i "defcon-vm.pem" ec2-user@<ec2-instance-IP>
```

To run Docker container:
```bash
docker run --name defcon --restart=unless-stopped -d -p 5001(host-port):22(container-port) public.ecr.aws/m3r2m1y9/defcondev-server:latest(image name)
```

For monitoring logged in IP and resource usage:
```bash
w
who -Ha
top
ps aux
```

Live logging:
cd into user directory
```bash
tail -10f .bash_history | awk -W interactive '/^#/{printf "%-4d [%s] %s ", ++n, strftime("%F %T", substr($0, 2)), ENVIRON["PWD"];next}; 1'
```
