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

resource "docker_image" "httpd" {
  name = "httpd:latest"
}

resource "docker_container" "my-apache-app" {
  name  = "my-apache-app"
  image = docker_image.httpd.name

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = abspath(path.module)
    container_path = "/usr/local/apache2/htdocs/"
  }
}
