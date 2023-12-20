variable "environment" {
  type = string
  default = "dev"
}

variable "bucket_names" {
  type = map(string)
  default = {
    dev   = "bucket1_dev"
    stage = "bucket1_staging"
    prod  = "bucket1_prod"
  }
}

# ... other variables for paths, distributions, IAM roles, etc.

