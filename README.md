# Terraform AWS Deployment

This project deploys a sample infrastructure on AWS using Terraform.

## Modules

- s3: Manages S3 buckets
- cloudfront: Manages CloudFront distributions
- iam: Manages IAM roles and policies

## Environments

- dev: Development environment
- staging: Staging environment
- prod: Production environment

## Usage

1. Fill in the placeholders in the variables and modules.
2. Initialize Terraform: `terraform init`
3. Create an execution plan: `terraform plan`
4. Apply the changes: `terraform apply`
