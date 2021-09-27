#!/bin/bash

# Allows sonarqube instance of Elastic search to use more virtual memory
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf

# Reloads system configurations
sudo sysctl --system

# Install sonarqube as a service 
docker-compose up -d 
