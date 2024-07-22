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

resource "docker_network" "react_express" {
  name = "react-express"
}

resource "docker_network" "express_mongo" {
  name = "express-mongo"
}

resource "docker_image" "mongo" {
  name = "mongo:latest"
}

resource "docker_container" "mongo" {
  name  = "mongo"
  image = docker_image.mongo.name
  volumes {
    host_path      = "${path.cwd}/data"
    container_path = "/data/db"
  }
  networks_advanced {
    name = docker_network.express_mongo.name
  }
}

resource "docker_image" "frontend" {
  name = "frontend"
}

resource "docker_container" "frontend" {
  name  = "frontend"
  image = docker_image.frontend.name
  ports {
    internal = 3000
    external = 3000
  }
  networks_advanced {
    name = docker_network.react_express.name
  }
}

resource "docker_image" "backend" {
  name = "backend"
}

resource "docker_container" "backend" {
  name  = "backend"
  image = docker_image.backend.name
  networks_advanced {
    name = docker_network.react_express.name
  }
  networks_advanced {
    name = docker_network.express_mongo.name
  }
}

