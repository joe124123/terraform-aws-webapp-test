output "cloudfront_access_role_arns" {
  value = { for k, v in aws_iam_role.cloudfront_access_role : k => v.arn }
}

output "role_arns" {
  value = { for k, v in aws_iam_role.role : k => v.arn }  # Includes all IAM roles
}

output "cloudfront_policy_arns" {
  value = { for k, v in aws_iam_policy.cloudfront_s3_access_policy : k => v.arn }
}

# ... other outputs as needed

