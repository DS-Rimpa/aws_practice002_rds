resource "aws_lambda_permission" "allow_sqs" {
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.sms_api_connector.function_name}"
  principal     = "events.amazonaws.com"
  statement_id = "AWSLambdaVPCAccessExecutionRole"
  source_arn = "arn:aws:events:eu-west-1:111122223333:rule/RunDaily"
}
resource "aws_lambda_function" "sms_api_connector" {
  function_name = "${var.lambda_sms_api_connector}"
  role          = "${var.iam_role}"
  s3_bucket = "${var.s3_lambda_bucket}"
  s3_key = "${var.jar_name}"
  handler = "com.tutorial.handler.ApiGatewayHandler::handleRequest"
  runtime = "java8"
  timeout = "25"
  memory_size = "512"
  tags = {
    tutorial_app_env = "${var.tutorial_app_env}",
    tutorial_app     = "${var.tutorial_app}"
    Name          = "${var.Name}"
  }
  environment {
    variables = {
      sms_sqs = "${var.outgoing_connector_sms_sqs}"
      AWS_BUCKET_PATH = "${var.s3_attachment_bucket}"
    }
  }
}