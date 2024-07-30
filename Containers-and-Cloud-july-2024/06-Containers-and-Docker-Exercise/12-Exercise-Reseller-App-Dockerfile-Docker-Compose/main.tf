#  needs to have the image locally or in dockerhub !!


terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_network" "backend" {
  name = "backend"
}

resource "docker_image" "mysql" {
  name = "mysql:8.0"
}

resource "docker_image" "resellerapp" {
  name = "reseller_app"
}

resource "docker_volume" "mysql_data" {
  name = "mysql-data"
}

resource "docker_container" "db" {
  name  = "mysql"
  image = docker_image.mysql.name

  volumes {
    host_path      = docker_volume.mysql_data.mountpoint
    container_path = "/var/lib/mysql"
  }

  networks_advanced {
    name = docker_network.backend.name
  }

  ports {
    internal = 3306
    external = 3306
  }

  env = [
    "MYSQL_ROOT_PASSWORD=my-secret-pw",
    "MYSQL_DATABASE=resellerdb",
    "MYSQL_USER=user",
    "MYSQL_PASSWORD=userpass"
  ]
}

resource "docker_container" "app" {
  name  = "app"
  image = docker_image.resellerapp.name

  networks_advanced {
    name = docker_network.backend.name
  }

  ports {
    internal = 8080
    external = 8080
  }

  env = [
    "SPRING_DATASOURCE_URL='jdbc:mysql://mysql_db:3306/resellerdb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC'",
    "SPRING_DATASOURCE_USERNAME=root",
    "SPRING_DATASOURCE_PASSWORD=my-secret-pw"
  ]

  restart = "on-failure"
}