# ... outputs from modules
# Root module outputs
output "cloudfront_domain_names" {
  value = module.dev_environment.cloudfront_domain_names
}

output "bucket_arns" {
  value = module.dev_environment.bucket_arns
}

# ... other outputs as needed

