
# Pulling it from my DockerHub repo
# terraform {
#   required_providers {
#     docker = {
#       source  = "kreuzwerker/docker"
#       version = "3.0.2"
#     }
#   }
# }

# provider "docker" {
#   host = "npipe:////./pipe/docker_engine"
# }

# resource "docker_image" "tracker-image" {
#   name = "miroslavvalsorim/tracker_app"
# }

# resource "docker_container" "tracker-container" {
#   name  = "tracker-app"
#   image = resource.docker_image.tracker-image.name

#   ports {
#     internal = "80"
#     external = "8080"
#   }
# }


# with already localy built image !!! (docker build -t tracker_app:latest .)
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

resource "docker_image" "tracker-image" {
  name = "tracker_app"
}

resource "docker_container" "tracker-container" {
  name  = "tracker-app"
  image = docker_image.tracker-image.name

  ports {
    internal = 80
    external = 8080
  }
}
