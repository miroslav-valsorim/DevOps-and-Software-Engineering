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

resource "docker_image" "sql-image" {
  name = "mcr.microsoft.com/mssql/server:latest"
}

resource "docker_volume" "sqldata" {
  name = "sqldata"
}

resource "docker_container" "sql-container" {
  name  = "sql-container"
  image = docker_image.sql-image.name
  restart = "always"
  
  env = [
    "ACCEPT_EULA=Y",
    "MSSQL_SA_PASSWORD=yourStrongPassword12#"
  ]

  ports {
    internal = 1433
    external = 1433
  }

  volumes {
    host_path      = docker_volume.sqldata.mountpoint
    container_path = "/var/opt/mssql"
  }
}
