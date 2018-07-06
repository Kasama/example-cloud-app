# Sample application for the Cloud Computing Course of University of São Paulo

Para executar a aplicação é necessário criar um cluster Docker Swarm, siga os passos a seguir para instalar Docker e criar o cluster.

## Setup da aplicação

### Instalação do Docker

Para cada máquina virtual que fará parte do cluster instale o Docker com o comando:
```
curl -sL https://get.docker.io | sudo bash -
sudo usermod -aG docker $(whoami)
```
após a instalação, é necessário abrir um novo shell (sair e entrar novamente, ou executar `newgrp docker`)

Selecione uma das máquinas para ser a manager. Execute:
```
docker swarm init --advertise-addr <endereço ip na rede local>
```
Esse comando inicializará o swarm com apenas um nó manager, e escreverá na tela um comando para adicionar workers no cluster.

Em cada uma das máquinas workers, execute o comando dado no passo anterior:
```
docker swarm join --token <TOKEN> <ip:port>
```
Caso tenha perdido a mensagem anterior, basta executar
```
docker swarm join-token worker
```
no nó manager para imprimí-lo novamente

todos os comandos seguintes deverão ser executado no nó manager

### Execução da aplicação

Para construir a imagem docker da aplicação, é necessário estar na pasta base da aplicação, e executar
```
docker build -t nuvemapp .
```
e para implantar a aplicação, podemos usar o comando
```
docker stack deploy -c app-stack.yml app
```

que irá inicializar o banco de dados e a aplicação Ruby On Rails. A inicialização pode demorar algum tempo, para verificar que a aplicação está funcionando, aguarde até que todos os serviços exibidos por `docker service ls` estejam com o número de réplicas igual a 1/1. Após a inicialização, é necessário criar as tabelas do banco de dados, para isso, basta executar de dentro do container da aplicação, o script de criação da base.
```
docker exec -it $(docker ps | grep rails | awk '{print $1}') rake db:migrate
```

---

após isso, é possível popular o banco com os dados com as informações de medicamentos do SUS. Essa etapa é opcional, mas recomendada, pois caso não seja executada, a base de dados ficará sem nehum registro. Para iniciar a população, navegue para a pasta `migration` e execute os comandos a seguir para construir a imagem Docker da migração de dados e executá-la:
```
cd migration
docker stack rm app
./build-migration.sh
./run-database.sh
./seed-database.sh
```

Essa operação pode demorar alguns minutos, mas quando for finalizada, é possível reiniciar a aplicação com os comandos:
```
./cleanup-env.sh
cd ..
docker stack deploy -c app-stack.yml app
```

---

Agora a aplicação está pronta para ser utilizada, sendo servida na porta 3000 do nó manager do swarm

### Monitoramento com Ganglia

Para monitoramento da aplicação, foi utilizada a ferramenta Ganglia com Graphite. Para executar essa stack, navegue para a pasta `monitoring` e execute o comando:
```
docker stack deploy -c monitoring-stack.yml monitoring
```

As dashboards de monitoramento do Graphite devem estar visiveis na porta 8089 do nó manager do swarm





## Group Members

 - Lucas Antognoni de Castro - 8936...
 - Roberto Pommella Alegro - 8936756


