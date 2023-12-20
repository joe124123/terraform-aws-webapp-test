output "bucket_arns" {
  value = { for key, value in aws_s3_bucket.bucket : key => value.arn }
}

# Output the website endpoint of a specific bucket (replace "bucket1" with the actual name)
output "bucket_website_endpoint" {
  value = aws_s3_bucket.bucket["bucket1"].website_endpoint
}

# ... other outputs as needed

