# xv6-env : docker image for building/running xv6-riscv

## Typical Usage

Make sure that you have a copy of [xv6-riscv](https://github.com/mit-pdos/xv6-riscv) distribution in the filesystem of your computer.
You can obtain it using the following command (Skip this step if you already have one).
```
$ git clone https://github.com/mit-pdos/xv6-riscv.git
```

Pull the docker image from the registry.
```
$ docker pull wtakuo/xv6-env
```

Start a container with the command below.
You should replace `path-to-xv6` with the *full path* to your copy of xv6-riscv.
```
$ docker run -it --rm -v path-to-xv6:/home/xv6/xv6-riscv wtakuo/xv6-env
```

If things go well, you should see the bash prompt of the container as follows. 
Note that `0c765f60374a` is the container ID that may vary.
```
xv6@0c765f60374a:~$ 
```

Now you can build and start xv6.
```
xv6@0c765f60374a:~$ cd xv6-riscv
xv6@0c765f60374a:~$ make
...
xv6@0c765f60374a:~$ make qemu
...
xv6 kernel is booting

hart 2 starting
hart 1 starting
init: starting sh
$ 
```
You can exit from xv6 by typing `ctrl-A` followed by `x`.

## Note

The container runs bash with user `xv6`.
The password of the user is `xv6`.

If you would like to install some packages using apt, you should first issue `sudo apt update`.
