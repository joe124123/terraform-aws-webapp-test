output "domain_names" {
  value = { for key, value in aws_cloudfront_distribution.distribution : key => value.domain_name }
}

