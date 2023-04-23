FROM node:latest

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./

RUN apt update
RUN apt install ffmpeg -y

RUN yarn

COPY . .

ARG FFMPEG_PATH=/usr/bin/ffmpeg
ENV env_var_name=$FFMPEG_PATH

CMD yarn start
