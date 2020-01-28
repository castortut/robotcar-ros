FROM ros:latest

RUN apt update && \
    apt install -y ros-melodic-joy && \
    rm -rf /var/cache/apt/*
