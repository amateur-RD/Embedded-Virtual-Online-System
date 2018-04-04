#!/bin/bash
#CONTAINER_ID=$(echo "123" | sudo -S docker run -it ssh-vnc)
CONTAINER_ID=$(echo "123" | sudo -S docker run -idt --rm dorowu/ubuntu-desktop-lxde-vnc)
#CONTAINER_ID=$(echo "222")
echo "123" | sudo -S docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_ID > /home/dodo/mytest/001.txt
echo $CONTAINER_ID >> /home/dodo/mytest/001.txt
