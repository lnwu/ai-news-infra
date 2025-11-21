terraform {
  backend "gcs" {
    bucket = "ai-news-infra-terraform-state"
    prefix = "terraform/state"
  }
}
