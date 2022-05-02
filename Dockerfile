FROM node:15 as builder

WORKDIR /usr/src/app

RUN npm install express --save && npm install mysql --save

COPY src .

FROM node:15-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache openssl

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY --from=builder /usr/src/app .

ENTRYPOINT [ "dockerize","-wait","tcp://database:3306","-timeout","20s","docker-entrypoint.sh" ]

CMD [ "node", "index.js" ]