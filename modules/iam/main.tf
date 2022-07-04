/*
data "aws_iam_policy_document" "admin-assume-role-policy" {
  statement {
    actions = ["*"]
    resources = ["*"]
  }
}
*/


resource "aws_iam_role" "snyk-admin-role" {
  name               = "snyk-${var.environment}-role"
	path = "/"

  assume_role_policy = <<EOF
{
		"Version": "2012-10-17",
		"Statement": [
				{
						"Sid": "",
						"Effect": "Allow",
						"Principal": {
						"Service": "ec2.amazonaws.com"
						},
						"Action": "sts:AssumeRole"
				}
		]
}
EOF
}

resource "aws_iam_role_policy" "this" {
  name   = "snyk-${var.environment}-policy"
  role   = aws_iam_role.snyk-admin-role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [ "*" ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "this" {
  name = "snyk-${var.environment}-profile"
  role = aws_iam_role.snyk-admin-role.name
}
