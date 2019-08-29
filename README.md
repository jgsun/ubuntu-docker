# ubuntu-docker
## How to run?

```
sudo docker run --rm -it panguolin/ubuntu
```

## How to run a docker as non-root user?

- ### add `username` into docker group
```
sudo groupadd docker
sudo gpasswd -a <username> docker
```
- ### (re)login as `username`, check if ok
```
docker ps
```
- ### another available solution for everyone
```
sudo chmod 666 /var/run/docker.sock 
```

## User init `userinit`
- ### example
```bash
$ cat userinit

#!/bin/sh

# gid: id -g
groupadd -g 1102 mygroup

# 123
password="\$6\$WaQoQkSO\$8yDB8n3mhFmusvETpiXOFskH/..LAPJXOx5ZDSaAz5UE97OUTHqemuFaD4Q7DG8k/bmDJmoBT5R43qag2qW0M1"

# uid: id -u
# gid: id -g
/usr/sbin/useradd -ms /bin/bash -d /home/ubuntu -u 3024008 -g 1102 -p ${password} ubuntu
```
- ### start docker
```
sudo docker run --rm -it -v /path/to/userinit:/userinit panguolin/ubuntu
```
