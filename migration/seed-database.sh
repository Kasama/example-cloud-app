#!/bin/bash

# Executa a migração dos dados para popular o banco de dados:
# - Coloca o container na mesma network que o banco de dados
# - Fornece variáveis de ambiente com informaçõe necessárias para conectar ao banco
docker run --rm -d \
  --network mysql-network \
  -e DB_HOST=mysql \
  -e DB_USER=root \
  -e DB_PASSWORD=password \
  -e DB_PORT=3306 \
  --name migration-runner \
  migration

docker logs migration-runner -f
