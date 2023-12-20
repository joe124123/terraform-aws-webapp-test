# ... outputs from modules

# Root module outputs
output "cloudfront_distribution_domains" {
  value = { for k, v in module.dev_environment.cloudfront_distribution_domains : k => v }
}

output "s3_bucket_website_endpoint" {
  value = module.dev_environment.s3_bucket_website_endpoint
}

# Additional outputs if needed
output "bucket_arns" {
  value = module.dev_environment.bucket_arns
}

# ... other outputs as needed
