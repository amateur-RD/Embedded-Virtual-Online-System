#!/bin/bash
echo "end"
echo "123" | sudo -S docker stop $1
#echo "123" | sudo -S docker rm $1
echo "123" | sudo -S sed -i "/$2/d" $3
