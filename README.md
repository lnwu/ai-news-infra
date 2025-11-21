# ai-news-infra

Infrastructure as Code for managing Terraform Cloud projects and workspaces.

## Projects

This Terraform configuration creates and manages the following projects in the `lnwu` organization:

- **ai-news** - AI news infrastructure project
- **learning-english** - English learning infrastructure project

## Prerequisites

To use this Terraform configuration, you need:

1. **Terraform** >= 1.0
2. **Terraform Cloud API Token** - Set the `TFE_TOKEN` environment variable with your Terraform Cloud API token

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

## Configuration

The infrastructure is defined in `main.tf` and includes:

- **TFE Provider**: Manages Terraform Cloud/Enterprise resources
- **lnwu Organization**: Main organization with email wind2729@gmail.com
- **Projects**: Two managed projects (ai-news and learning-english)