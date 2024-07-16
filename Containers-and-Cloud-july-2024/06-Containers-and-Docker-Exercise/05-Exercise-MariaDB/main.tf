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

resource "docker_image" "mariadb-image" {
  name = "mariadb:latest"
}

resource "docker_network" "my_network" {
  name = "mariadb_network"
}

resource "docker_container" "mariadb-server" {
  name    = "mariadb-server"
  image   = docker_image.mariadb-image.name
  restart = "always"

  env = [
    "MARIADB_USER=maria_user",
    "MARIADB_PASSWORD=db_password",
    "MARIADB_ROOT_PASSWORD=secret_password"
  ]

}

resource "docker_container" "mariadb-client" {
  name    = "mariadb-client"
  image   = docker_image.mariadb-image.name
  restart = "always"

  env = [
    "MARIADB_ROOT_PASSWORD=secret_password",
  ]

}

