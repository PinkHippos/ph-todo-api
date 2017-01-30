FROM node:argon

WORKDIR usr/mircoserv/ph-todo-api

ADD src ./src
ADD package.json ./package.json
ADD yarn.lock .

RUN npm i -g coffee-script yarn; yarn install

RUN coffee -o ./build/seneca -c ./src/seneca/*.coffee ; coffee -o ./build/todo_api -c ./src/todo_api/*.coffee ; coffee -o ./build -c ./src/*.coffee

RUN rm -rf ./src

WORKDIR usr/mircoserv/ph-todo-api/build
