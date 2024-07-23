#  needs to have the image locally or in dockerhub !!

#  volumes changed to /app/data 

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

resource "docker_network" "frontend" {
  name = "frontend"
}


resource "docker_network" "backend" {
  name = "backend"
}

resource "docker_volume" "db" {
  name = "db"
}

resource "docker_volume" "vote" {
  name = "vote"
}

resource "docker_volume" "result" {
  name = "result"
}

resource "docker_image" "redis" {
  name = "redis:latest"
}

resource "docker_image" "postgres" {
  name = "postgres:latest"
}

resource "docker_image" "result" {
  name = "result"
}

resource "docker_image" "vote" {
  name = "vote"
}

resource "docker_image" "worker" {
  name = "worker"
}

resource "docker_container" "vote" {
  name  = "vote"
  image = docker_image.vote.name

  volumes {
    host_path      = docker_volume.vote.mountpoint
    container_path = "/app/data"
  }

  networks_advanced {
    name = docker_network.frontend.name
  }

  networks_advanced {
    name = docker_network.backend.name
  }

  ports {
    internal = 80
    external = 5000
  }
}

resource "docker_container" "result" {
  name  = "result"
  image = docker_image.result.name

  volumes {
    host_path      = docker_volume.result.mountpoint
    container_path = "/app/data"
  }

  networks_advanced {
    name = docker_network.frontend.name
  }

  networks_advanced {
    name = docker_network.backend.name
  }

  ports {
    internal = 80
    external = 5001
  }
}

resource "docker_container" "worker" {
  name  = "worker"
  image = docker_image.worker.name

  networks_advanced {
    name = docker_network.backend.name
  }
}

resource "docker_container" "redis" {
  name  = "redis"
  image = docker_image.redis.name

  networks_advanced {
    name = docker_network.backend.name
  }
}

resource "docker_container" "db" {
  name  = "db"
  image = docker_image.postgres.name

  networks_advanced {
    name = docker_network.backend.name
  }

  env = [
    "POSTGRES_PASSWORD=postgres",
    "POSTGRES_USER"
  ]
}