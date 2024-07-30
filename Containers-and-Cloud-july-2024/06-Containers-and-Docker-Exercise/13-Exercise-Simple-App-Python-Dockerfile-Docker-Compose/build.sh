cd SimplePageApp

docker build -t simple_app .

docker run -d --name web -p 8000:8000 -v ./static:/app/staticfiles -e DEBUG=False simple_app 

# with docker-compose.yml

docker-compose build

docker-compose up -d