resource "aws_s3_bucket" "bucket" {
  for_each = var.bucket_names
  bucket = each.value

  # Enable versioning
  versioning {
    enabled = true
  }

  # Enable server-side encryption using AES-256
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Conditional website configuration based on environment
  website {
    index_document = var.environment == "prod" ? "index.html" : null
    error_document = var.environment == "prod" ? "error.html" : null
  }

  # ... other S3 bucket configurations as needed
}

output "bucket_arns" {
  value = { for k, v in aws_s3_bucket.bucket : k => v.arn }
}

# Output the website endpoint of a specific bucket (replace "bucket1" with the actual name)
output "bucket_website_endpoint" {
  value = aws_s3_bucket.bucket["bucket1"].website_endpoint
}

