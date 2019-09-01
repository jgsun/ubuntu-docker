FROM ubuntu:18.04

MAINTAINER "jgsun"

ENV PYTHONIOENCODING UTF-8
ENV PYTHON_PATH /usr/bin/python3
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get clean && apt-get upgrade -y && apt-get update -y --fix-missing

RUN apt-get -y install \
        git \
        mercurial \
        libglib2.0-dev \
        libpixman-1-dev \
        python3 \
        python3-dev \
        bpython \
        curl \
        openssh-server \
        net-tools \
        bridge-utils \
        uml-utilities \
        iptables-persistent \
        iputils-ping \
        iproute2 \
        tcpdump \
        openvswitch-switch \
        qemu-system-arm \
        qemu-system-x86 \
        docker.io \
        telnet \
        cpio \
        unzip \
        rsync \
        bc \
        tree \
        htop \
        sudo \
        gcc \
        g++ \
        make \
        cmake \
        vim \
        sshfs
        
# slim down image
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
        python3 get-pip.py && \
        rm -rf get-pip.py

RUN useradd -ms /bin/bash jgsun && \
	usermod -aG sudo jgsun && \
	echo "root:123" | chpasswd && \
	echo "jgsun:123" | chpasswd && \
	sed -ri 's/^#PasswordAuthentication\s+.*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
#     chown -R ubuntu:ubuntu /home/ubuntu
# 
# USER ubuntu
# WORKDIR /home/ubuntu
# ENV HOME /home/ubuntu

# COPY init /init
# ENTRYPOINT ["/init"]
CMD ["/bin/bash"]
