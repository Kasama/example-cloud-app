# Usa imagem padrão do node js versão 8
FROM node:8

# Configura o diretório de trabalho para /app
WORKDIR /app

# Copia os arquivos da pasta local para o workdir
COPY . /app

# Adiciona variávies de ambiente padrões
ENV DB_HOST=mysql
ENV DB_USER=root
ENV DB_PORT=3306
ENV DB_PASSWORD=password

# Executa a instalação de dependencias para o projeto
RUN npm install

# Configura o comando padrão para npm run run, que executa o programa
CMD [ "npm", "run", "run" ]
