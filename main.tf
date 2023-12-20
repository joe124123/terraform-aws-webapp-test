terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Replace with your desired region
  access_key = "your_access_key"
  secret_key = "your_secret_key"
}

module "dev_environment" {
  source = "./env/dev"
  environment = "dev"
}

# module "staging_environment" {
#   source = "./env/staging"
#   environment = "staging"
# }

# module "prod_environment" {
#   source = "./env/prod"
#   environment = "prod"
# }

