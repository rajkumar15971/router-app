FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

COPY package.json ./
RUN npm install

COPY . .

EXPOSE 8080

CMD [ "npm", "start" ]
