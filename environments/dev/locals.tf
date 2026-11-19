locals {
  project_prefix = "gcp-${var.environment}"

  common_labels = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "enterprise-platform"
  }

  vpc_name = "${local.project_prefix}-vpc"
}