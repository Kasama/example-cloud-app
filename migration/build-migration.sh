#!/bin/bash

# Cria a imagem para popular o banco
cd ./migration && docker build -t migration .
