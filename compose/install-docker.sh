#!/bin/bash

sudo apt update && sudo apt upgrade -y

################################################################
########                  Docker                     ###########
################################################################

# Limpa versões antigas do Docker
sudo apt remove -y docker docker-engine docker.io containerd runc \
    docker-ce docker-ce-cli containerd.io && \
    sudo apt autoremove -y

# Dependencias para usar repositório HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Chave do repositório Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Repositório Docker
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Atualiza a lista de repositórios
sudo apt-get update

# Instala o Docker e seus componentes
sudo apt install -y docker-ce \
    docker-ce-cli \
    containerd.io

# Habilita o Docker a iniciar com o sistema
sudo systemctl enable docker

# Permite executar o docker sem o sudo
sudo groupadd docker
sudo usermod -aG docker "$USER"
newgrp docker