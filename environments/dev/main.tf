resource "google_compute_network" "main" {
  name                    = local.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"

  description = "Custom VPC for ${var.environment} environment"

  delete_default_routes_on_create = false
  lifecycle {
    prevent_destroy = true
  }
}