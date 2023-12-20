variable "environment" {
  type    = string
  default = "dev"
}

variable "bucket_names" {
  type = map(string)
  default = {
    "bucket1" = "bucket1_name"
    "bucket2" = "bucket2_name"
    # ... other bucket names
  }
}

# ... other variables as needed

