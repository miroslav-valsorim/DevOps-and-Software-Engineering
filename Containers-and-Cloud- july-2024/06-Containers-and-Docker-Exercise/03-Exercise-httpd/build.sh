docker run -d --name my-apache-app -p 8080:80 -v ${PWD}:/usr/local/apache2/htdocs/ httpd:latest

# with docker-compose.yml
docker-compose build

docker-compose up -d