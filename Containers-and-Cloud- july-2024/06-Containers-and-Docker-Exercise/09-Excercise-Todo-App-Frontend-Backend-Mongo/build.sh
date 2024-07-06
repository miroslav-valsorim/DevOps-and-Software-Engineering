docker network create react-express

docker network create express-mongo

docker pull mongo:latest

docker build frontend -f frontend/Dockerfile -t frontend

docker build backend -f backend/Dockerfile -t backend

docker run -d --name frontend -p 3000:3000 --network react-express frontend

docker run -d --name backend --network react-express backend

docker network connect express-mongo backend

docker run -d --name mongo --network express-mongo -v ${PWD}/data:/data/db mongo

# with docker-compose.yml

docker-compose build

docker-compose up -d