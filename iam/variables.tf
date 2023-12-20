resource "aws_iam_role" "cloudfront_access_role" {
  count = length(var.distribution_names)
  name  = "${var.distribution_names[count.index]}-access-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
