output "bucket_arns" {
  value = { for key, value in aws_s3_bucket.bucket : key => value.arn }
}

