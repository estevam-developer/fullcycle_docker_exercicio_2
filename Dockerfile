FROM node:15 as builder

WORKDIR /usr/src/app

RUN npm install && npm install mysql --save

COPY src .

FROM node:15-alpine

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app .

CMD [ "node", "index.js" ]