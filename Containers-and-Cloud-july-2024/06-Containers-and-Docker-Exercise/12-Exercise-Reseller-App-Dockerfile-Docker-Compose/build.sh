docker build -t reseller_app .

docker pull mysql:8.0

docker network create backend

# if you have mysql available on local system, stop the service because it works on port 3306
docker run -d --name mysql_db -p 3306:3306 -v mysql-data:/var/lib/mysql --network backend -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_DATABASE=resellerdb -e MYSQL_USER=user -e MYSQL_PASSWORD=userpass mysql:8.0

# wait a few seconds (restarts) because it cant connect to the DB right away when it starts !!!
docker run -d --name resellerapp -p 8080:8080 --network backend -e SPRING_DATASOURCE_URL="jdbc:mysql://mysql_db:3306/resellerdb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" -e SPRING_DATASOURCE_USERNAME=root -e SPRING_DATASOURCE_PASSWORD=my-secret-pw --restart on-failure reseller_app

# with docker-compose.yml

docker-compose build

docker-compose up -d
