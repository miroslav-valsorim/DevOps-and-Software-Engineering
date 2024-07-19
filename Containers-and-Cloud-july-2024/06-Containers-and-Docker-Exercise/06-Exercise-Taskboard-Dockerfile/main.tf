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

resource "docker_image" "taskboard_app" {
  name = "miroslavvalsorim/taskboard_app:latest"
}

resource "docker_container" "taskboard_app_container" {
  name  = "taskboard_app_cont"
  image = docker_image.taskboard_app.name
}
