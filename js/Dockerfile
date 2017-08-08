FROM node:8

WORKDIR /root/node_app

COPY hello.js package.json ./

RUN npm install

EXPOSE 3000

CMD ["node",  "hello.js"]
