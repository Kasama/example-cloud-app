#!/bin/bash

# Cria uma rede para o banco de dados
docker network create mysql-network

# Executa o banco de dados usando docker-compose
# O compose sobe o banco MySQL na porta padrão (3306)
# com o usuário padrão (root) e senha `password` e
# database primário `medicamentos`.
#
# O comando também monta como volume uma pasta local
# para possibilitar persistencia dos dados do banco
docker run --rm -d \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_DATABASE=medicamentos \
  -v "$(pwd)/../data:/var/lib/mysql" \
  --network mysql-network \
  --name mysql \
  mysql:5.6
