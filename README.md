# ai-news-infra

Infrastructure as Code for AI News application using Terraform and Google Cloud Platform.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- GCP Project with appropriate permissions
- GCS bucket for Terraform state (see setup instructions below)

## Setup

### 1. Configure GCP Authentication

```bash
# Login to GCP
gcloud auth application-default login

# Set your project
gcloud config set project YOUR_PROJECT_ID
```

### 2. Create GCS Bucket for Remote State

Before initializing Terraform, you need to create a GCS bucket to store the Terraform state:

```bash
# Set your project ID
export PROJECT_ID="your-gcp-project-id"

# Create the bucket for Terraform state
gsutil mb -p ${PROJECT_ID} -l us-central1 gs://ai-news-infra-terraform-state

# Enable versioning on the bucket (recommended)
gsutil versioning set on gs://ai-news-infra-terraform-state
```

**Note:** The bucket name `ai-news-infra-terraform-state` must be globally unique. If this name is taken, update the bucket name in `backend.tf`.

### 3. Configure Variables

Create a `terraform.tfvars` file from the example:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` and set your values:

```hcl
project_id  = "your-gcp-project-id"
region      = "us-central1"
environment = "dev"
```

### 4. Initialize Terraform

```bash
terraform init
```

This will:
- Download required provider plugins
- Configure the GCS backend for remote state

### 5. Plan and Apply

```bash
# Review the planned changes
terraform plan

# Apply the infrastructure
terraform apply
```

## Project Structure

```
.
├── backend.tf              # Remote state backend configuration
├── providers.tf            # Terraform and provider configuration
├── variables.tf            # Input variables
├── outputs.tf              # Output values
├── main.tf                 # Main infrastructure resources
├── terraform.tfvars.example # Example variables file
└── README.md               # This file
```

## Remote State Backend

This project uses Google Cloud Storage (GCS) as the backend for Terraform state management. The state file is stored remotely in a GCS bucket, which provides:

- **State Locking**: Prevents concurrent modifications
- **Versioning**: Maintains history of state changes
- **Collaboration**: Allows team members to share state
- **Security**: State is encrypted at rest in GCS

### Backend Configuration

The backend is configured in `backend.tf`:

```hcl
terraform {
  backend "gcs" {
    bucket = "ai-news-infra-terraform-state"
    prefix = "terraform/state"
  }
}
```

## Managing Infrastructure

### View Current State

```bash
terraform show
```

### List Resources

```bash
terraform state list
```

### Destroy Resources

```bash
terraform destroy
```

## Best Practices

1. **Never commit `terraform.tfvars`** - It's already in `.gitignore` as it may contain sensitive data
2. **Always run `terraform plan`** before `terraform apply`
3. **Use workspaces** for managing multiple environments (dev, staging, prod)
4. **Enable bucket versioning** for state file recovery
5. **Restrict bucket access** using IAM policies

## Troubleshooting

### Backend initialization fails

If you get an error during `terraform init` about the bucket not existing:
1. Make sure you've created the GCS bucket (see step 2 in Setup)
2. Verify you have permissions to access the bucket
3. Check that the bucket name in `backend.tf` matches your created bucket

### Authentication errors

If you encounter authentication errors:
```bash
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
```

## Contributing

When making changes to the infrastructure:
1. Create a feature branch
2. Make your changes
3. Run `terraform fmt` to format the code
4. Run `terraform validate` to check configuration
5. Submit a pull request with a description of changes