# main docker commands

docker pull [image] # pulls a docker image from docker hub

docker run [image] # runs selecter docker image in interactive mode
# if image isnt localy available the command will directly pull it and use it, so IF the image isnt pulled first we start this command,
# with the parameter needed like '-d'(detached mode), container name, -p (ports), [image]

docker run -d [image] # docker can run your container in detached mode in the background (without being attached to the container)

docker run -d [container_name] [image] # creates the container with the selected name

docker run -d -p 5000:80 [image] # created container that our port 5000 connect to the container port 80

docker images # checks all docker images available

docker ps # check all working containers

docker ps -a # shows all runing/non-runing containers

docker logs [name] # check logs from selected container, can also be selected with the id (few number of it to show that is unique)

docker logs [name] -f # check logs in runtime (real time)

docker network ls # shows all available networks  

docker exec -it [name] /bin/sh # 'logs' into the selected container with 'it' interactive mode, can also be selected with the id (few number of it to show that is unique)
docker exec -it [name] /bin/bash 

docker rm [name] # if container is running will need force command
docker rm [name] -f # f stands for FORCE deletes container, can also be selected with id (few number of it to show that is unique)

docker atach [name] # ataches to the docker container like (docked run [image] WITHOUT -detached mode), can be selected with id too

docker rmi [name] # removes docker image, gets latest by default
# if there is container connected to this image, has to be deleted too in order image to be deleted !

docker start [name] # start selected container if exist, can also be used with id

docker stop [name] # can also be stopped with the id (few number of it to show that is unique)

docker run -p 5000:80 -d -v c:\my-docker-folder:/app [image] # will run this container with volume that will always point to 'c:\my-docker-folder:/app'
docker run -p 5000:80 -d -v [created-volume-name]:/app [image]
# to describe volume its something like usb drive, that containers will always point to it, this folder will point to our local directory if we point to local directory !
# we map C:\my-docker-folder to /app in our container

docker create volume [name] # creates new volume

docker volume ls # checks volumes available

docker volume inspect [name] # checks volume info

docker volume rm [name] # removes volume