#!/bin/bash

apt update
apt install curl openvswitch-switch -y

docker_check=$(dpkg -l | grep -i docker)
if [ -n "$docker_check" ]; then
    echo "DOCKER INSTALADO!"
else
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    echo "DOCKER INSTALADO COM SUCESSO!!!"
fi

docker build $(pwd)/images/blue_team_image/ -t blue-team
docker build $(pwd)/images/ssh_image/ -t web-server
docker build $(pwd)/images/user_image/ -t alpine-user
docker build $(pwd)/images/ddos_image/ -t ddos-attack
docker build $(pwd)/images/dic_ssh_image/ -t dic-attack-ssh
docker build $(pwd)/images/containernet_cyrm_image/ -t containernet-cyrm

docker pull dperson/samba
