variable "project_id" {
  type        = string
  description = "GCP project ID where resources will be deployed"
}

variable "region" {
  description = "GCP region where regional resources will be deployed"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
