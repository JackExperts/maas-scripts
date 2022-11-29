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

  ```bash
  chmod +x install_proxy.sh
  ```
  ```bash
  ./install_proxy.sh
  ```

- Pronto, seu Zabbix deve ter iniciado! Para gerenciar o processo, utilize o script proxy-maas.sh.

  ```bash
  chmod +x proxy-maas.sh
  ```
  ```bash
  ./proxy-maas.sh
  ```
