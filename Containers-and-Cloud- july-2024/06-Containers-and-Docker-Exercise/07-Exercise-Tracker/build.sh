docker build -t miroslavvalsorim/tracker_app .

docker push miroslavvalsorim/tracker_app
# docker push miroslavvalsorim/tracker_app:latest

docker run -d --name tracker_app -p 8080:80 miroslavvalsorim/tracker_app

# with docker-compose.yml

docker-compose build

docker-compose up -d

docker push miroslavvalsorim/tracker_app
# docker push miroslavvalsorim/tracker_app:latest

docker run -d --name tracker_app -p 8080:80 miroslavvalsorim/tracker_app