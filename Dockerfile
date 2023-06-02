FROM node:20-bullseye-slim
WORKDIR /home/app/frontend

RUN apt-get update

COPY package.json yarn.lock ./
RUN yarn install

EXPOSE 3000