module "dynamodb-table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "2.0.0"
  # insert the 8 required variables here
  name     = "${var.cluster_tablename}"
  hash_key = "${var.primarykey}"
  range_key = "${var.sortkey}"
  table_class = "${var.tableclass}"
  attributes = [
    {
      name = "${var.primarykey}"
      type = "S"
    },
     {
      name = "${var.sortkey}"
      type = "S"
    }

  ]
  tags= merge(tomap(local.common_tags),{Name="${var.cluster_tablename}"},{type = "DB"})
  
}


module "lambda_role" {
  source = "git@github.com:myhanseencloud/terraform_modules.git//iamrole?ref=master"
  name               = "${var.function_name}_role"
  description        = "IAM role for lambda"
  path               = "/instance_roles/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  policy             = file("./files/lambdarole_iam_policy.json")
  max_session_duration = 7200
  tags= merge(tomap(local.common_tags),{Name="${var.function_name}_role"},{type = "ROLE"})
}

/*
module "cloudwatch_logging" {
  source = "./modules/cloudwatch"
  loggroup_name = "${var.function_name}_group"
  logs_path   = "/aws/lambda"
  log_group_retention_in_days = "7"
  tags = var.tags
}

*/

module "lambda_alerttrace" {
  source = "git@github.com:myhanseencloud/terraform_modules.git//lambda?ref=master"
  create_function = true
  payload_filename = "${var.payload_filename}.zip"
  function_name    = var.function_name
  description      = var.description
  role_arn         = "arn:aws:iam::189161884001:role/instance_roles/${var.function_name}_role"
  handler          = "${var.payload_filename}.lambda_handler"
  memory_size      = var.memory_size
  runtime          = "python3.9"
  source_code_hash = "${data.archive_file.init.output_base64sha256}"
  create_permission = true
  statement_id  = var.statement_id
  permission_action   = var.permission_action
  principal     = "sns.amazonaws.com"
  source_arn    = "arn:aws:sns:eu-west-2:189161884001:${var.sns_name}"
  lambda_function_arn = "arn:aws:lambda:eu-west-2:189161884001:function:${var.function_name}"
  tags= merge(tomap(local.common_tags),{Name="${var.function_name}"},{type = "LAMBDA"})
}

module "sns_lambda_topic" {
  source = "git@github.com:myhanseencloud/terraform_modules.git//sns?ref=master"
  name = var.sns_name
  tags= merge(tomap(local.common_tags),{Name="${var.function_name}_role"},{type = "SNS"})
  subscriptions = [
	{
		protocol = "lambda"
		endpoint = module.lambda_alerttrace.function_arn
		raw_message_delivery = false
	}
]

}




