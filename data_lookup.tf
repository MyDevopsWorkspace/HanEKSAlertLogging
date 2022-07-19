data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}


data "archive_file" "init" {
  type        = "zip"
  source_file = "./src/ReceivePrometheusSNSNotifications.py"
  output_path = "ReceivePrometheusSNSNotifications.zip"
}


data "aws_caller_identity" "current" {}

locals {
  common_tags = {
    account_id = data.aws_caller_identity.current.account_id
    env = terraform.workspace
  }
}