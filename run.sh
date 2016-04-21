#!/bin/bash

curl -sSL https://get.docker.com/ | sh
sudo wget -O /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m`
sudo chmod +x /usr/local/bin/docker-compose
git clone https://github.com/Infra-Red/haproxy-elk-docker.git ~/haproxy-elk-docker
cd ~/haproxy-elk-docker && sudo docker-compose up -d
