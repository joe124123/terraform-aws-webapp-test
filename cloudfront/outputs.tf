output "distribution_ids" {
  value = { for k, v in aws_cloudfront_distribution.distribution : k => v.id }
}

output "distribution_domain_names" {
  value = { for k, v in aws_cloudfront_distribution.distribution : k => v.domain_name }
}

output "origin_access_identity_paths" {
  value = { for k, v in aws_cloudfront_origin_access_identity.origin_access_identity : k => v.cloudfront_access_identity_path }
}

# ... other outputs as needed

