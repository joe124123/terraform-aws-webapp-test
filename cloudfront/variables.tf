# ... variables for CloudFront module
variable "paths_and_bucket_names" {
  type = map(string)
  default = {
    "/auth"    = "bucket1_dev"  # Replace with actual bucket names
    "/info"    = "bucket2_dev"
    "/customers" = "bucket3_dev"
  }
}

