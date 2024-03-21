# Defcon Dockerfiles

To build:

```bash
docker build -t container-image-name .
```

To run: 
```bash
docker run -d -p <host-port>:22 image-name:latest
```

To SSH:
```bash
ssh -p <host-port> <username>@host-ip
```
