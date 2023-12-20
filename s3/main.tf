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
}

