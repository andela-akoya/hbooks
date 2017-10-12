FROM node:8.7

MAINTAINER koyagabriel@gmail.com

COPY . /www/var

WORKDIR /www/var

RUN npm install

ENTRYPOINT ["yarn", "start"]
