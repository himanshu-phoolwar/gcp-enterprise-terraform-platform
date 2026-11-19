output "image_id" {
  value = data.docker_image.nginx_image.id
}

output "repo_digest" {
  value = data.docker_image.nginx_image.repo_digest
}

output "nginx_logs" {
  value = data.docker_logs.nginx.logs_list_string
}

output "http_requests" {
    value = [
        for log in data.docker_logs.nginx.logs_list_string : log if can(regex("GET /", log))
    ]
}