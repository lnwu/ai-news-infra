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

provider "tfe" {}

locals {
  ai_news_workspace_name = "ai-news"
}

data "tfe_organization" "lnwu" {
  name = "lnwu"
}

resource "tfe_project" "ai_news" {
  organization = data.tfe_organization.lnwu.name
  name         = local.ai_news_workspace_name
}

resource "tfe_workspace" "ai_news" {
  name         = local.ai_news_workspace_name
  organization = data.tfe_organization.lnwu.name
  project_id   = tfe_project.ai_news.id
}
