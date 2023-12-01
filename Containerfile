# Use an official base image
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="mail@cinaber.de"
LABEL org.opencontainers.image.source https://github.com/cinber/tamarin-container

RUN mkdir /home/ape/
WORKDIR /home/ape/

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    tldr \
    libtool \
    autoconf \
    automake \
    pkg-config \
    libusb-1.0-0-dev \
    git \
    python3 \
    python3-pip

RUN ln -s /usr/bin/python3 /usr/bin/python

# Clone and build OpenOCD
RUN git clone --depth 1 https://github.com/stacksmashing/openocd.git
WORKDIR /home/ape/openocd
RUN ./bootstrap && \
    ./configure && \
    make && \
    make install

WORKDIR /home/ape/

# Clone Tamarin firmware
RUN git clone --depth 1 https://github.com/stacksmashing/tamarin-firmware.git

WORKDIR /home/ape/

# Clone ipwndfu
RUN git clone https://github.com/axi0mX/ipwndfu.git

WORKDIR /home/ape/
