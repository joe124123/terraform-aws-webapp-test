# ... resources for CloudFront distributions
resource "aws_cloudfront_distribution" "distribution" {
  for_each = {
    for path, bucket_name in var.paths_and_bucket_names :
    path => bucket_name
  }

  origin {
    domain_name = aws_s3_bucket.bucket[each.value].bucket_regional_domain_name
    origin_id   = each.value
  }

  # ... other CloudFront configuration options

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = origin.id

    # Redirect to HTTPS
    viewer_protocol_policy = "redirect-to-https"

    # Configure caching and other options as needed
  }

  ordered_cache_behavior {
    path_pattern     = each.key
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = origin.id

    # Configure caching and other options as needed
  }

  # ... other resources and options
}

