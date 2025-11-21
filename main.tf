terraform {
  required_version = ">= 1.0"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.71.0"
    }
  }

  backend "remote" {
    organization = "lnwu"
    workspaces {
      name = "ai-news"
    }
  }
}

provider "tfe" {
  organization = "lnwu"
}

locals {
  project_name = "ai-news"
}

resource "tfe_project" "ai_news" {
  name = local.project_name
}

resource "tfe_workspace" "ai_news" {
  name       = local.project_name
  project_id = tfe_project.ai_news.id
}
