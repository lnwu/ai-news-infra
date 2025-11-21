# Backend configuration for remote state in Google Cloud Storage
# Note: Backend configuration cannot use variables. Update the bucket name
# directly in this file if using a different bucket name.
# For multiple environments, use different prefixes or separate buckets.
terraform {
  backend "gcs" {
    bucket = "ai-news-infra-terraform-state"
    prefix = "terraform/state"
  }
}
