FROM ubuntu

LABEL maintainer="takuo@c.titech.ac.jp"

ARG TZ=Asia/Tokyo
ARG USER=xv6
ARG GROUP=xv6
ARG PASS=xv6
ENV HOME=/home/${USER}
ENV XV6=${HOME}/xv6-riscv

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
 && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      sudo \
      git \
      build-essential \
      gdb-multiarch \
      qemu-system-misc \
      gcc-riscv64-linux-gnu \
      binutils-riscv64-linux-gnu \
 && rm -rf /var/lib/apt/lists/* \
 && groupadd ${GROUP} \
 && useradd -g ${GROUP} -m ${USER} \
 && (echo "${USER}:${PASS}" | chpasswd) \
 && gpasswd -a ${USER} sudo \
 && mkdir -p ${XV6} \
 && chown -R ${USER}:${GROUP} ${XV6}

USER ${USER}
WORKDIR ${HOME}

ENTRYPOINT ["/bin/bash"]


