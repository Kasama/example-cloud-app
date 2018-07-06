#!/bin/bash

# Para o processo de popular o banco
docker stop migration-runner

# Para o banco de dados
docker stop mysql

# Remove a rede do banco de dados
docker network rm mysql-network

# Remove a imagem buildada de popular o banco
docker image rm migration
