cd backend
docker build -t backend .
cd ..

cd frontend
docker build -t frontend . 
cd ..

docker login

docker tag frontend miroslavvalsorim/frontend
docker tag backend miroslavvalsorim/backend

docker push miroslavvalsorim/frontend
docker push miroslavvalsorim/backend

##
docker pull mongo

docker network create goals
docker network ls

docker volume create logs
docker volume create data
docker volume ls

# Important!!! the name of the mongodb should be checked with the name set in the application line 86 in the app.js file
docker run -d --name mongodb --network goals -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=secret -v data:/data/db mongo

docker run -d --name backend -p 80:80 --network goals -v logs:/logs -e MONGODB_USERNAME=root -e MONGODB_PASSWORD=secret miroslavvalsorim/backend

docker run -d --name frontend -p 3000:3000 --network goals -v /frontend/src:/backend/src miroslavvalsorim/frontend

