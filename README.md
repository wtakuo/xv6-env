xv6-env
=======
Docker image for building/running xv6-riscv

## Typical Usage
Make sure that you have a copy of [xv6-riscv](https://github.com/mit-pdos/xv6-riscv) distribution in the filesystem of your host computer.
You can obtain it using the following command (Skip this step if you already have one).
```
$ git clone https://github.com/mit-pdos/xv6-riscv.git
```

The image is available on [Docker Hub](https://hub.docker.com/r/wtakuo/xv6-env).
You can start a new container with the command below.
Note that `path-to-xv6-riscv` refers to the path to your copy of xv6-riscv distribution on the host.
```
$ cd path-to-xv6-riscv
$ docker run -it --rm -v $(pwd):/home/xv6/xv6-riscv wtakuo/xv6-env
```
The image supports multiple architectures (currently arm64 and amd64).
If you need a container for a specific architecture, use [`wtakuo/xv6-env-arm64`](https://hub.docker.com/r/wtakuo/xv6-env-arm64) or [`wtakuo/xv6-env-amd64`](https://hub.docker.com/r/wtakuo/xv6-env-amd64) instead.

If things go well, you should see the following output from the newly started container.
```
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

xv6@0c765f60374a:~/xv6-riscv$ 
```
The shell prompt (`xv6@0c765f60374a:~/xv6-riscv$`) consists of the username (`xv6`), hostname (`0c765f60374a`), and current working directory (`/home/xv6/xv6-riscv`). The hostname is the same as the container ID. So it may differ from the above example.

Now make sure that you can build and start xv6.
```
xv6@0c765f60374a:~/xv6-riscv$ make
...
xv6@0c765f60374a:~/xv6-riscv$ make qemu
...
xv6 kernel is booting

hart 2 starting
hart 1 starting
init: starting sh
$ 
```
To exit from xv6, type `ctrl-A` followed by `x`.

## Opfs
For your convenience, this docker image contains [opfs](https://github.com/titech-os/opfs), a simple utility for operating on xv6 file system images. 

## To build the image by yourself
If you want to build the docker image by yourself, you can use the following commands.
```
$ git pull https://github.com/wtakuo/xv6-env.git
$ cd xv6-env
$ docker build -t wtakuo/xv6-env .
```

## Note
The container runs bash with user `xv6`.
The password of the user is `xv6`.

If you would like to install some packages using apt, you should first issue `sudo apt update`.
