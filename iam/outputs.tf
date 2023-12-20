output "role_arns" {
  value = { for key, value in aws_iam_role.role : key => value.arn }
}

