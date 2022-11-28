#!/bin/bash
# Source: https://github.com/JackExperts/maas-scripts.git
# Local do script: https://raw.githubusercontent.com/JackExperts/maas-scripts/main/install_proxy.sh

## Instalacao Docker
curl https://get.docker.com | bash

## Instalacao Docker Compose
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

## Definicoes do proxy
read -p "Informe o hostname do proxy: " ZBX_HOSTNAME
read -p "Informe o hostname do MaaS: " ZBX_SERVER_HOST

echo -e "
ZBX_PROXYMODE=0
ZBX_SERVER_HOST=$ZBX_SERVER_HOST
ZBX_SERVER_PORT=10051 # Deprecated since 6.0.0
ZBX_HOSTNAME=$ZBX_HOSTNAME
ZBX_HOSTNAMEITEM=system.hostname
ZBX_DEBUGLEVEL=3
ZBX_PROXYLOCALBUFFER=12
ZBX_PROXYOFFLINEBUFFER=72
ZBX_PROXYHEARTBEATFREQUENCY=60
ZBX_CONFIGFREQUENCY=120
ZBX_DATASENDERFREQUENCY=1
ZBX_STARTPOLLERS=20
ZBX_STARTPOLLERSUNREACHABLE=10
ZBX_STARTTRAPPERS=5
ZBX_STARTPINGERS=10
ZBX_STARTDISCOVERERS=4
ZBX_STARTHTTPPOLLERS=5
ZBX_HOUSEKEEPINGFREQUENCY=1
ZBX_CACHESIZE=128M
ZBX_STARTDBSYNCERS=4
ZBX_HISTORYCACHESIZE=128M
ZBX_HISTORYINDEXCACHESIZE=64M
ZBX_TIMEOUT=30" > .env_prx

echo -e "
ZBX_ENABLEREMOTECOMMANDS=1 # Deprecated since 5.0.0
ZBX_LOGREMOTECOMMANDS=1
ZBX_SERVER_HOST=$ZBX_SERVER_HOST
ZBX_HOSTNAME=$ZBX_HOSTNAME
ZBX_HOSTNAMEITEM=system.hostname
ZBX_TIMEOUT=30" > .env_agent

## Download subida do proxy
rm -rf ./docker-compose.yaml && curl -L https://raw.githubusercontent.com/JackExperts/maas-scripts/main/docker-compose.yaml -o ./docker-compose.yaml

## Download script de gestao
rm -rf ./proxy-maas.sh && curl -L https://raw.githubusercontent.com/JackExperts/maas-scripts/main/proxy-maas.sh -o ./proxy-maas.sh
chmod +x ./proxy-maas.sh

## subida do proxy
echo -e "Para gerenciar o processo, utilize o script proxy-maas.sh."
./proxy-maas.sh

docker-compose up -d && echo -e "Ambiente instalado e iniciado com sucesso!!! \n"
