provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true # tells the provider to retain the image when Terraform removes the image resource.
}


resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "terraform-nginx"
  ports {
    internal = 80
    external = 8080
  }
}

locals {
  environments = ["dev", "prd"]
}

resource "docker_container" "count_demo" {
  count = length(local.environments)

  name  = "terraform-${local.environments[count.index]}-nginx"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8081 + count.index
  }
}

resource "docker_container" "foreach_demo" {
  for_each = {
    "dev"  = "8091"
    "prod" = "8093"
  }
  name  = "terraform-${each.key}-foreach-nginx"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = each.value
  }
}