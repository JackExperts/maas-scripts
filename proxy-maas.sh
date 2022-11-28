#!/bin/bash

help(){
  echo -e "Informe a opcao desejada: start, stop ou restart. \n"

  echo -e "Para iniciar o proxy:
  $0 start \n"

  echo -e "Para parar o proxy:
  $0 stop \n"

  echo -e "Para reiniciar o proxy:
  $0 restart \n"

}

start(){
  echo -e "Iniciando o proxy do MaaS... \n"
  docker-compose up -d
}

stop(){
  echo -e "Parando o proxy do MaaS... \n"
  docker-compose down --remove-orphans
}

restart(){
  echo -e "Reiniciando o proxy do MaaS. \n"
  stop;
  start;
}

case $1 in
  start)
    start;
  ;;
  stop)
    stop;
  ;;
  restart)
    restart;
  ;;
  *)
    help;
  ;;
esac