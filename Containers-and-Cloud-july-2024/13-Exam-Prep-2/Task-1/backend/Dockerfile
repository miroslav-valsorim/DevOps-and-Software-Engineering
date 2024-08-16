FROM node

WORKDIR /app

COPY . .

RUN npm install

ENV MONGODB_USERNAME=root
ENV MONGODB_PASSWORD=secret

EXPOSE 80

ENTRYPOINT [ "npm", "start" ]