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

resource "docker_volume" "volume" {
  name = "static"
}

resource "docker_image" "simple_app" {
  name = "simple_app"
}

resource "docker_container" "app" {
  name  = "app"
  image = docker_image.simple_app.name

  volumes {
    host_path      = docker_volume.volume.mountpoint
    container_path = "/app/staticfiles"
  }

  ports {
    internal = 8000
    external = 8000
  }

  env = [
    "DEBUG=False"
  ]

}