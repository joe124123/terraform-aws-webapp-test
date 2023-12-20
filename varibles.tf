variable "environment" {
  type    = string
  default = "dev"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

# Other variables for S3 buckets, CloudFront distributions, etc.
variable "bucket_names" {
  type = map(string)
  default = {
    "bucket1" = "bucket1_name"
    "bucket2" = "bucket2_name"
    # ... other bucket names
  }
}

variable "paths_and_bucket_names" {
  type = map(string)
  default = {
    "/auth" = "bucket1"
    "/info" = "bucket2"
    "/customers" = "bucket3"
    # ... other paths and corresponding buckets
  }
}

variable "distribution_names" {
  type = list(string)
  default = ["distribution1", "distribution2", "distribution3"]
}

# ... other variables as needed

