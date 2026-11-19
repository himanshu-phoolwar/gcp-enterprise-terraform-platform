output "vpc_name" {
  description = "Name of the VPC"
  value       = google_compute_network.main.name
}

output "vpc_id" {
  description = "Unique ID of the VPC"
  value       = google_compute_network.main.id
}

output "vpc_self_link" {
  description = "Self link of the VPC"
  value       = google_compute_network.main.self_link
}