FROM node:15

WORKDIR /usr/src/app

COPY src .

CMD [ "node", "index.js" ]