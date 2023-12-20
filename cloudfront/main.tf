resource "aws_cloudfront_distribution" "distribution" {
  count = length(var.distribution_names)  # Use count for dynamic creation based on distribution names

  origin {
    domain_name = aws_s3_bucket.bucket[var.distribution_names[count.index]].bucket_regional_domain_name
    origin_id   = var.distribution_names[count.index]

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity[count.index].cloudfront_access_identity_path
    }
  }

  enabled             = true
  default_root_object = "index.html"  # Replace with your default object if needed

  # ... other distribution configuration options as needed

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  default_cache_behavior {  # Include default cache behavior
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = origin.id

    # Redirect to HTTPS
    viewer_protocol_policy = "redirect-to-https"

    # Configure caching and other options as needed
  }

  ordered_cache_behavior {  # Include ordered cache behavior
    count = length(var.paths_and_bucket_names)  # Use count for multiple cache behaviors

    path_pattern     = var.paths_and_bucket_names[count.index]
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = origin.id

    # Configure caching and other options as needed
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"  # Adjust as needed for geo-restrictions
    }
  }

  # ... other resources and options as needed

  depends_on = [
    aws_iam_role_policy_attachment.cloudfront_policy_attachment
  ]
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  count = length(var.distribution_names)  # Create OAI for each distribution
  comment = "${var.distribution_names[count.index]}-origin-access-identity"
}

