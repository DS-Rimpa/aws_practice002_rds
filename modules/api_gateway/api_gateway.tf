resource "aws_api_gateway_rest_api" "tutorial" {
  name = "${var.api_gateway_name}"
  policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Principal": "*",
"Action": "execute-api:Invoke",
"Resource": "arn:aws:execute-api:us-east-1:${var.client_account}:*/*"
}
]
}
EOF
  tags = {
    tutorial_app_env="${var.tutorial_app_env}",
    tutorial_app="${var.tutorial_app}",
    Name="${var.Name}"
  }
}
resource "aws_api_gateway_resource" "resource" {
  path_part   = "sms"
  rest_api_id = "${aws_api_gateway_rest_api.tutorial.id}"
  parent_id   = "${aws_api_gateway_rest_api.tutorial.root_resource_id}"
}
resource "aws_api_gateway_method" "method" {
  rest_api_id   = "${aws_api_gateway_rest_api.tutorial.id}"
  resource_id   = "${aws_api_gateway_resource.resource.id}"
  http_method   = "POST"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "integration" {
  rest_api_id          = "${aws_api_gateway_rest_api.tutorial.id}"
  resource_id          = "${aws_api_gateway_resource.resource.id}"
  http_method          = "${aws_api_gateway_method.method.http_method}"
  integration_http_method = "POST"
  type                 = "AWS_PROXY"
  uri = "${var.sms_api_connector_invoke_arn}"

  #  request_templates = {
  #    "application/json"="$input.body"
  #  }
}
resource "aws_api_gateway_deployment" "tutorial" {
  depends_on = ["aws_api_gateway_integration.integration"]
  rest_api_id = "${aws_api_gateway_rest_api.tutorial.id}"
  stage_name = "${var.tutorial_app_stage}"
}
resource "aws_lambda_permission" "apigw" {
  statement_id = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${var.sms_api_connector_function_name}"
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_rest_api.tutorial.execution_arn}/*/*"
}
resource "aws_api_gateway_stage" "stage" {
  deployment_id = "${aws_api_gateway_deployment.tutorial.id}"
  rest_api_id   = "${aws_api_gateway_rest_api.tutorial.id}"
  stage_name    = "${var.tutorial_app_stage}"
}
#resource "aws_wafv2_web_acl_association" "association_tutorial" {
#  resource_arn = "${aws_api_gateway_stage.stage.arn}"
#  web_acl_arn  = "${var.web_acl_arn}"
#}
