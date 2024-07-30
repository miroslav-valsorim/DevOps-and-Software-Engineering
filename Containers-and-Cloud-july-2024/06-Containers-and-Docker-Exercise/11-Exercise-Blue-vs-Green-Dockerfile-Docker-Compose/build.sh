docker network create frontend
docker network create backend

docker pull redis

docker pull postgres

cd result
docker build -t result .

cd..
cd vote
docker built -t vote .

cd ..
cd worker
docker build -t worker .

docker volume create db
docker volume create vote
docker volume create result

docker run -d --name vote --network frontend -p 5000:80 -v vote:/app vote
docker network connect backend vote

docker run -d --name result --network frontend -p 5001:80 -v result:/app result
docker network connect backend result 

docker run -d --name worker --network backend worker
docker run -d --name redis --network backend redis
docker run -d --name db --network backend -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER -v db:/var/lib/postgresql/data postgres

# with docker-compose.yml

docker-compose build
docker-compose up -d