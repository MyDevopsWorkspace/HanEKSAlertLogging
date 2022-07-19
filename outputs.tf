output "dynamodb_table_arn" {
  value = "${module.dynamodb-table.dynamodb_table_arn}"
}

output "dynamodb_table_id" {
  value = "${module.dynamodb-table.dynamodb_table_id}"
}
 
 output "iam_role_arn" {
  value       = "${module.lambda_role.iam_role_arn}"
}

output "iam_role_name" {
  value       = "${module.lambda_role.iam_role_name}"
}


output "iam_policy_id" {
  value ="${module.lambda_role.iam_policy_id}"
}


output "iam_policy_name" {
  value = "${module.lambda_role.iam_policy_name}"
}

output "function_name" {
     value ="${module.lambda_alerttrace.function_name}" 
     }

output "function_arn" { 
    value = "${module.lambda_alerttrace.function_arn}" 
    }


output "this_sns_topic_arn" {
  value       = "${module.sns_lambda_topic.this_sns_topic_arn}"
}

output "this_sns_subscription_arn" {
  value       = "${module.sns_lambda_topic.this_sns_subscription_arn}"
}