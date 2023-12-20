terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region  # Use the environment variable for region
  access_key = "your_access_key"
  secret_key = "your_secret_key"
}

module "dev_environment" {
  source = "./env/dev"
  environment = var.environment  # Pass environment variable to module
  region = var.region
  # ... other variables
}

# module "staging_environment" {
#   source = "./env/staging"
#   # ... other variables
# }

# module "prod_environment" {
#   source = "./env/prod"
#   # ... other variables
# }

# ... other resources as needed

# Example conditional resource for production environments:
resource "aws_cloudwatch_log_group" "example" {
  name = "example-log-group"

  count = var.environment == "prod" ? 1 : 0

  retention_in_days = 30
  # ... other configuration
}

