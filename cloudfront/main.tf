resource "aws_cloudfront_distribution" "distribution" {
  for_each = {
    for path, bucket_name in var.paths_and_bucket_names :
    path => bucket_name
  }

  origin {
    domain_name = aws_s3_bucket.bucket[each.value].bucket_regional_domain_name
    origin_id   = each.value

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
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

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.cloudfront_policy_attachment
  ]
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "OAI for CloudFront distributions"
}

