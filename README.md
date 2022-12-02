![logo](https://assets.zabbix.com/img/logo/zabbix_logo_500x131.png)

# Scripts de configuração MaaS

Projeto para publicação de scripts genérico para execuções remotas. 


### Como usar o instalador Zabbix Proxy

- Defina as variáveis de configuração:

  > **Informação importante: verifique com o time técnico as informações necessárias antes de definir as variáveis abaixo.**

  ```bash
  export ZBX_HOSTNAME="<nome do seu zabbix proxy>
  ```
  ```bash
  export ZBX_SERVER_HOST="<endereço da central de monitoramento>
  ```
  > **Certifique de que a central de monitoramento está acessível por meio da porta 10051 a partir do seu Zabbix Proxy.**

- Execute o script de instalação:

    > **ATENÇÃO**
  - Instalação via pacote (suporta: Debian 9, 10 e 11, CentOS 7, 8 e 0 e RedHat 8):

    ```bash
    chmod +x install_package_zabbixproxy.sh
    ```
    ```bash
    ./install_package_zabbixproxy.sh
    ```

  - Instalação via Docker (Não suporta CentOS ou RedHat 8)

    ```bash
    chmod +x install_docker_zabbixproxy.sh
    ```
    ```bash
    ./install_docker_zabbixproxy.sh
    ```

- Pronto, seu Zabbix deve ter iniciado! 

  - Para gerenciar o container Docker, disponibilizamos o script abaixo.

  ```bash
  chmod +x manager_container_docker.sh
  ```
  ```bash
  ./manager_container_docker.sh
  ```
