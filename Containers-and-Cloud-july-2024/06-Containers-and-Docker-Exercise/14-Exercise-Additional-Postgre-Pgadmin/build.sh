# https://hevodata.com/learn/docker-postgresql/

docker pull postgres
docker run --name postgresql -e POSTGRES_USER=myusername -e POSTGRES_PASSWORD=mypassword -p 8081:5432 -v /data:/var/lib/postgresql/data -d postgres

docker pull dpage/pgadmin4:latest
docker run --name my-pgadmin -p 8080:80 -e 'PGADMIN_DEFAULT_EMAIL=youremail@gmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=postgresmaster' -d dpage/pgadmin4

docker inspect postgresql -f “{{json .NetworkSettings.Networks }}”