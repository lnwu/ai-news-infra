# Main infrastructure configuration
# Add your GCP resources here

# Example: Enable required APIs
resource "google_project_service" "required_apis" {
  for_each = toset([
    "compute.googleapis.com",
    "storage.googleapis.com",
  ])

  project = var.project_id
  service = each.key

  disable_on_destroy = false
}
