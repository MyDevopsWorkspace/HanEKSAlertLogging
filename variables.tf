variable "region" {
  description = "specify the region"
  default        = "eu-west-2"
}

variable "cluster_tablename" {
  description = "dynamo db table to store the alert state"
  default        = "EKS_cluster_monitoring"
}


variable "primarykey" {
  description = "Primary key for the table"
  default        = "cluster_name"
}

variable "sortkey" {
  description = "sort key for the table"
  default        = "alert_name"
}

variable "tableclass" {
  description = "sort key for the table"
  default        = "STANDARD"
}

variable "function_name" {
  description = "Name of the Lambda function"
}

variable "description" {
  description = "Description of the Lambda function"
  type        = string
  default     = ""
}

variable "role_arn" {
  description = "ARN of the IAM role to dermine access to the Lambda function"
}

variable "handler" {
  description = "The required function entrypoint"
}

variable "memory_size" {
  description = "Amount of memory in MB the function can use at run time"
  default     = null
}

variable "runtime" {
  description = "Identifier of the functions runtime engine"
  default = "python3.9"
}

variable "layers" {
  description = "List of Layer Version ARNs to attach to the function"
  type        = list
  default     = []
}

variable "kms_key" {
  description = "ARN for the KMS encryption key"
  default     = null
}

variable "function_variables" {
  description = "Map of environment variables for the lambda function"
  type        = map(string)
  default     = null
}

variable "create_permission" {
  description = "Whether to create a Lambda permission to attach to the function"
  type        = bool
  default     = false
}

variable "statement_id" {
  description = "SID for the lambda permission"
  default     = ""
}

variable "permission_action" {
  description = "Lambda action you want to allow in the statement"
  default     = ""
}

variable "principal" {
  description = "Principal getting the permission"
  default     = ""
}

variable "source_arn" {
  description = "ARN of the source resource with this permission"
  default     = ""
}

variable "tags" {
  description = "Map of tags applied to Lambda function"
  default     = {}
}

variable "subnet_ids" {
  description = "List of subnet IDs associated with the Lambda Function"
  default     = []
  type        = list
}

variable "security_group_ids" {
  description = "List of security group IDs associated with the lambda function"
  default     = []
  type        = list
}

variable "timeout" {
  description = "The amount of time before the lambda function times out."
  default     = "3"
}


variable "source_code_hash" {
  description = "A base64-encoded SHA256 hash of the package file, used to trigger updates"
  default     = ""
}

variable "max_event_age" {
  description = "Maximum age of a request that Lambda sends to a function for processing in seconds."
  type        = number
  default     = 60
}

variable "max_retry_attempts" {
  description = "Maximum number of times to retry when the function returns an error"
  type        = number
  default     = 2
}

variable "payload_filename" {
  description = "Name of the file with the function code"
}


variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = null
}

variable "policy" {
  description = "The fully-formed AWS policy as JSON"
  type        = string
  default     = null
}

variable "delivery_policy" {
  description = "The SNS delivery policy"
  type        = string
  default     = null
}

variable "application_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "application_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "application_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "http_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "http_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "http_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "lambda_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "lambda_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "lambda_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "sqs_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "sqs_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "sqs_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default     = null
}



variable "subscriptions" {
  description = "List of Subscription config blocks"
  type        = list(map(string))
  default     = []
}


variable "sns_name" {
  description = "sns Topic name"

}
