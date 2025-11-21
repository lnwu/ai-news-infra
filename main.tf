terraform {
  required_version = ">= 1.0"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.50"
    }
  }

  backend "remote" {
    organization = "lnwu"
    workspaces {
      name = "lnwu-infra"
    }
  }
}

provider "tfe" {}

data "tfe_organization" "lnwu" {
  name = "lnwu"
}

resource "tfe_project" "ai_news" {
  organization = data.tfe_organization.lnwu.name
  name         = "ai-news"
}
