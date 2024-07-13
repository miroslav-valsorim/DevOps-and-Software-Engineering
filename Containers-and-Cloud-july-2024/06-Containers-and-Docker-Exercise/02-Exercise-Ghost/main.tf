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

resource "docker_image" "ghostimage" {
  name = "ghost:latest"
}

resource "docker_container" "ghostcontainer" {
  name  = "ghost_app"
  image = docker_image.ghostimage.name

  ports {
    internal = 2368
    external = 3001
  }

  env = [
    "NODE_ENV=development",
  ]
}
