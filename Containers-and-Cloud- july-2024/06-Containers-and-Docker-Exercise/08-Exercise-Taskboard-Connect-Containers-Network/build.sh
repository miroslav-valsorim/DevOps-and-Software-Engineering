docker build . -f TaskBoard.Webapp/Dockerfile -t miroslavvalsorim/taskboard_app

docker login

docker push miroslavvalsorim/takboard_app
# docker push miroslavvalsorim/taskboard_app:latest

# with docker-compose.yml

docker-compose build

docker-compose up -d

docker push miroslavvalsorim/taskboard_app
# docker push miroslavvalsorim/taskboard_app:latest