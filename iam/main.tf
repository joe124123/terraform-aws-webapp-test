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

resource "aws_iam_policy" "cloudfront_s3_access_policy" {
  count = length(var.distribution_names)
  name  = "${var.distribution_names[count.index]}-s3-access-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        aws_s3_bucket.bucket[var.distribution_names[count.index]].arn,
        "${aws_s3_bucket.bucket[var.distribution_names[count.index]].arn}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cloudfront_policy_attachment" {
  count = length(var.distribution_names)
  role       = aws_iam_role.cloudfront_access_role[count.index].name
  policy_arn = aws_iam_policy.cloudfront_s3_access_policy[count.index].arn
}

