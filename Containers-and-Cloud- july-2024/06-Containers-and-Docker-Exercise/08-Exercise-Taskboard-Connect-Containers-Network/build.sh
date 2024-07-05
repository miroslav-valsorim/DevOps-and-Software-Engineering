docker network create taskboard_network

# build the image again because of changes in TaskBoard.WebApp/appsettings.json !!!
docker build . -f TaskBoard.Webapp/Dockerfile -t miroslavvalsorim/taskboard_app

docker push miroslavvalsorim/taskboard_app:latest

docker run -e ACCEPT_EULA=Y -e MSSQL_SA_PASSWORD=yourStrongPassword12# -p 1433:1433 -v sqldata:/var/opt/mssql --network taskboard_network --name sqlserver -d mcr.microsoft.com/mssql/server

docker run -d -p 5000:80 --name taskboard --network taskboard_network miroslavvalsorim/taskboard_app 

docker network inspect taskboard_network

# with docker-compose.yml

docker network create taskboard_network

docker-compose build

docker-compose up -d