#!/bin/bash

sudo apt update && sudo apt upgrade -y

################################################################
########                  Sonarqube                  ###########
################################################################

# Permite que os processos usem mais memória virtual
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf

# Carrega a configuração de memória virtual
sudo sysctl --system

# Instala o Sonarqube como um serviço
docker-compose up -d 