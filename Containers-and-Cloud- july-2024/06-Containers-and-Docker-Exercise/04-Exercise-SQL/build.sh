docker volume create sqldata

docker volume ls

docker run -e ACCEPT_EULA=Y -e MSSQL_SA_PASSWORD=yourStrongPassword12# -p 1433:1433 -v sqldata:/var/opt/mssql -d mcr.microsoft.com/mssql/server

# with docker-compose.yml
docker-compose build

docker-compose up -d