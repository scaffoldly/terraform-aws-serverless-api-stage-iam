data "aws_iam_policy_document" "base" {
  # TODO: A-la-carte choices of AWS services that CF manages

  statement {
    actions = [
      "kms:DescribeCustomKeyStores",
      "kms:ListKeys",
      "kms:GenerateRandom",
      "kms:ListAliases",
      "logs:PutLogEvents",
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "cloudwatch:PutMetricData",
      "xray:PutTelemetryRecords",
      "xray:PutTraceSegments",
      "ses:SendEmail",
      "ses:SendRawEmail",
      "ses:List*",
      "ses:Describe*",
      "ses:Get*",
      "ses:*Template*",
    ]

    resources = ["*"] # TODO Be more specific
  }

  statement {
    actions = [
      "dynamodb:List*",
      "dynamodb:Describe*",
      "dynamodb:*Item*",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:GetRecords",
      "dynamodb:GetShardIterator",
      "dynamodb:DescribeStream",
      "dynamodb:ListShards",
      "dynamodb:ListStreams",
    ]

    resources = [
      "arn:*:dynamodb:*:*:table/${var.stage}-${var.repository_name}*"
    ]
  }

  statement {
    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:PutSecretValue",
    ]

    resources = [
      "arn:*:secretsmanager:*:*:secret:lambda/${var.stage}/${var.repository_name}*",
    ]
  }

  statement {
    actions = [
      "sns:Publish",
    ]

    resources = [
      "arn:*:sns:*:*:${var.stage}-*",
    ]
  }

  statement {
    actions = [
      "execute-api:ManageConnections",
    ]

    resources = [
      "arn:*:execute-api:*:*:*/${var.stage}/*",
    ]
  }

  statement {
    actions = [
      "lambda:InvokeFunction",
      "lambda:InvokeAsync"
    ]

    resources = [
      "arn:*:lambda:*:*:function:*-nonlive-*"
    ]
  }

  dynamic "statement" {
    for_each = var.kms_key_id == "" ? [] : [1]
    content {
      actions = [
        "kms:Describe*",
        "kms:Get*",
        "kms:List*",
        "kms:Decrypt",
        "kms:*Encrypt*",
        "kms:GenerateDataKey*",
        "kms:Verify",
        "kms:Sign"
      ]

      resources = [
        "arn:*:kms:*:*:key/${var.kms_key_id}",
      ]
    }
  }
}

resource "aws_iam_role" "role" {
  name = "${var.repository_name}-${var.stage}"
  tags = {}

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  inline_policy {
    name   = "base-policy"
    policy = data.aws_iam_policy_document.base.json
  }
}

