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

Tmux Config

```bash
nano $HOME/.tmux.conf
```
Config
```bash
set -g prefix `
set -g base-index 1              # start indexing windows at 1 instead of 0
set -g detach-on-destroy off     # don't exit from tmux when closing a session
set -g escape-time 0             # zero-out escape time delay
set -g history-limit 1000000     # increase history size (from 2,000)
set -g renumber-windows on       # renumber all windows when any window is closed
set -g set-clipboard on          # use system clipboard

bind d detach
bind r command-prompt "rename-window %%"
bind R source-file ~/.tmux.conf
bind ^A last-window
bind ^W list-windows
bind w list-windows
bind z resize-pane -Z
bind s split-window
bind h split-window -v -c "#{pane_current_path}"
bind v split-window -h -c "#{pane_current_path}"
bind '"' choose-window
bind : command-prompt
bind x kill-pane
bind c swap-pane -D
bind S choose-session
```

Reload tmux config inside tmux session:
```bash
tmux ls
tmux
Ctrl + B + :
"source-file ./.tmux.conf"
```

Attach to existing session
```bash
tmux attach
```
