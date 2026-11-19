provider "docker" {}

data "docker_image" "nginx_image" {
  name = "nginx:latest"
}

data "docker_logs" "nginx" {
    name = "terraform-dev-nginx"
    logs_list_string_enabled = true
}
