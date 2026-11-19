resource "google_service_account" "app" {
  for_each = toset(["dev", "prod"])

  project      = var.project_id
  account_id   = "app-${each.key}"
  display_name = "Application Service Account ${each.key}"
}