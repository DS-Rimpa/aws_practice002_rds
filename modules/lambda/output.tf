output "sms_api_connector_invoke_arn" {
  value = "${aws_lambda_function.sms_api_connector.invoke_arn}"
}
output "sms_api_connector_function_name" {
  value = "${aws_lambda_function.sms_api_connector.function_name}"
}