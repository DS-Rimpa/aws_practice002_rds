module "lambda" {
  source = "./modules/lambda"
  iam_role = "${module.iam.iam_role}"
  s3_attachment_bucket = "${var.s3_attachment_bucket}"
  s3_lambda_bucket = "${var.s3_lambda_bucket}"
  lambda_sms_api_connector = "${var.lambda_sms_api_connector}"
#  aws_region = "${var.aws_region}"
  tutorial_app_env = "${var.tutorial_app_env}"
  tutorial_app = "${var.tutorial_app}"
  Name = "${var.Name}"
  outgoing_connector_sms_sqs = "${var.outgoing_connector_sms_sqs}"
  jar_name = "${var.jar_name}"
}
module "api_gateway" {
  source = "./modules/api_gateway"
  sms_api_connector_invoke_arn = "${module.lambda.sms_api_connector_invoke_arn}"
  sms_api_connector_function_name = "${module.lambda.sms_api_connector_function_name}"
  tutorial_app_env = "${var.tutorial_app_env}"
  tutorial_app_stage = "${var.tutorial_app_stage}"
  tutorial_app = "${var.tutorial_app}"
  Name = "${var.Name}"
  api_gateway_name = "${var.api_gateway_name}"
#  web_acl_arn = "${var.web_acl_arn}"
  vpc_ids = "${var.vpc_ids}"
  client_account = "${var.client_account}"
  vpc_endpoint = "${var.vpc_endpoint}"
}
module "iam" {
  source = "./modules/iam"
  Name = "${var.Name}"
  tutorial_app_env = "${var.tutorial_app_env}"
  tutorial_app = "${var.tutorial_app}"
  aws_iam_role = "${var.aws_iam_role}"
  aws_iam_sqs_policy = "${var.aws_iam_sqs_policy}"
  aws_iam_log_policy = "${var.aws_iam_log_policy}"
  aws_iam_policy_attachment = "${var.aws_iam_policy_attachment}"
  aws_iam_policy_attachment_log = "${var.aws_iam_policy_attachment_log}"

}