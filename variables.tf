variable "lambda_sms_api_connector" {}
variable "outgoing_connector_sms_sqs" {}
variable "lambda_outgoing_api_connector" {}
variable "aws_region" {}
variable "jar_name" {}
variable "tutorial_app_env" {}
variable "tutorial_app" {}
variable "tutorial_app_stage" {}
variable "Name" {}
variable "vpc_id" {}
#variable "subnet_ids" { type = "list" }
variable "subnet_ids" {}
#variable "security_group_ids" { type = "list" }
variable "security_group_ids" {}
#variable "web_acl_arn" {}
variable "client_account" {}
variable "vpc_endpoint" {}
#variable "vpc_ids" { type = "list" }
variable "vpc_ids" {}
variable "s3_attachment_bucket" {}
variable "s3_lambda_bucket" {}
variable "api_gateway_name" {}
variable "aws_iam_role" {}
variable "aws_iam_sqs_policy" {}
variable "aws_iam_log_policy" {}
variable "aws_iam_policy_attachment" {}
variable "aws_iam_policy_attachment_log" {}
