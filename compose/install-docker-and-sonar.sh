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

# Baixa o docker-compose
sudo curl -L \
    "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose

# Torna o comando executável
sudo chmod +x /usr/local/bin/docker-compose

# Permite executar o docker sem o sudo
sudo groupadd docker
sudo usermod -aG docker "$USER"
newgrp docker

# Adiciona comand completion
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose


# Adiciona o jenkins ao grupo root
sudo gpasswd -a jenkins root

# Reinicia o docker
sudo service docker restart

################################################################
########                  Sonarqube                  ###########
################################################################

# Permite que os processos usem mais memória virtual
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf

# Carrega a configuração de memória virtual
sudo sysctl --system

# Instala o Sonarqube como um serviço
docker-compose up -d 