Como buildar a imagem
=====================

Para buildar a imagem do script, basta usar o script `build-migration.sh`

Como rodar o banco de dados
===========================

Para executar o banco de dados Mysql, basta usar o script `run-database.sh`

Como popular o banco de dados
=============================

Para popular o banco de dados, basta executar o script `.seed-database.sh`

Popular o banco é um processo demorado, portanto o container que realiza esse
trabalho é executado no background e o log mostrado pode ser abandonado sem
interferir na população, pois o container ainda estará executando.

Como limpar o ambiente
======================

Para limpar o ambiente, basta executar o script `.cleanup-env.sh`
