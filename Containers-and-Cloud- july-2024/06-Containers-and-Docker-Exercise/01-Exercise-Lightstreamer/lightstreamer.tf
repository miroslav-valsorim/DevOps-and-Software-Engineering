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

resource "docker_image" "lightstreamer-image" {
  name = "lightstreamer"
}

resource "docker_container" "lightstreamer-container" {
  name  = "lightstreamer-container"
  image = resource.docker_image.lightstreamer-image.name

  ports {
    internal = "8080"
    external = "80"
  }
}