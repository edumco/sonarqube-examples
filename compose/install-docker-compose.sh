#!/bin/bash

sudo apt update && sudo apt upgrade -y

# Baixa o docker-compose
sudo curl -L \
    "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose

# Torna o comando executável
sudo chmod +x /usr/local/bin/docker-compose

# Adiciona comand completion
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
