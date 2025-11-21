# ai-news-infra

Infrastructure as Code for managing Terraform Cloud projects and workspaces.

## Overview

This Terraform configuration creates and manages the AI News project and workspace in the Terraform Cloud `lnwu` organization.

## Resources

The configuration provisions the following Terraform Cloud resources:

- **ai-news Project** - Main project for AI news infrastructure
- **ai-news Workspace** - Workspace associated with the ai-news project

## Prerequisites

To use this Terraform configuration, you need:

1. **Terraform** >= 1.0
2. **Terraform Cloud API Token** - Set the `TFE_TOKEN` environment variable with your Terraform Cloud API token
3. **Terraform Cloud Account** - An active account in the `lnwu` organization

## Setup

1. Clone this repository
2. Set your Terraform Cloud API token:
   ```bash
   export TFE_TOKEN="your-api-token-here"
   ```
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Review the plan:
   ```bash
   terraform plan
   ```
5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Configuration Details

The infrastructure is defined in `main.tf`:

- **Terraform Version**: >= 1.0
- **Provider**: HashiCorp TFE (Terraform Cloud) v0.71.0
- **Backend**: Remote backend stored in Terraform Cloud (`lnwu` organization, `ai-news` workspace)
- **Organization**: `lnwu`