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
    cmake \
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

# Clone the Pico-SDK repository
WORKDIR /home/ape
RUN git clone https://github.com/raspberrypi/pico-sdk.git
WORKDIR /home/ape/pico-sdk

# Checkout the specific commit of the Pico-SDK
RUN git checkout 4fe995d0ec984833a7ea9c33bac5c67a53c04178

# Set the PICO_SDK_PATH environment variable
ENV PICO_SDK_PATH=/home/ape/pico-sdk
WORKDIR /home/ape/

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
WORKDIR /home/ape/tamarin-firmware
RUN cmake 
WORKDIR /home/ape/tamarin-firmware/build
RUN make    
WORKDIR /home/ape/

# Clone ipwndfu & bonobo configs
RUN git clone https://github.com/axi0mX/ipwndfu.git
RUN git clone https://github.com/lambdaconcept/bonobo-configs.git
