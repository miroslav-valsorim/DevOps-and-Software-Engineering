docker pull lightstreamer:latest

docker run -d --name ls-server -p 80:8080 lightstreamer

# with docker-compose.yml
docker-compose build

docker-compose up -d