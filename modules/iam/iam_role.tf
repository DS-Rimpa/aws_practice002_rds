resource "aws_iam_role" "tutorial_lambda_role" {
  name               = "${var.aws_iam_role}"
  assume_role_policy = <<EOF
{
"Version":"2012-10-17",
"Statement":[
{
"Action":"sts:AssumeRole",
"Principal":{
"Service":"lambda.amazonaws.com"
},
"Effect":"Allow",
"Sid":""
}
]
}
EOF
  tags = {
    tutorial_app_env = "${var.tutorial_app_env}",
    tutorial_app     = "${var.tutorial_app}"
    Name          = "${var.Name}"
  }
}
resource "aws_iam_policy" "tutorial_lambda_sqs_policy" {
  name        = "${var.aws_iam_sqs_policy}"
  description = "SQS policy for lambda"
  policy      = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Action":[
         "sqs:*"
       ],
       "Effect": "Allow",
      "Resource": "*"
     }
   ]
}
EOF
}

resource "aws_iam_policy_attachment" "policy_attach" {
  name = "${var.aws_iam_policy_attachment}"
  roles = [aws_iam_role.tutorial_lambda_role.name]
  policy_arn = "${aws_iam_policy.tutorial_lambda_sqs_policy.arn}"
}
resource "aws_iam_policy" "tutorial_apiconnector_lambda_logging" {
  name        = "${var.aws_iam_log_policy}"
  path        = "/"
  description = "IAM policy for logging from a lambda"
  policy      = <<EOF
{
"Version": "2012-10-17",
"Statement": [
  {
    "Action": [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ],
    "Resource": "arn:aws:logs:*:*:*",
    "Effect": "Allow"
   }
 ]
}
EOF
}
resource "aws_iam_policy_attachment" "logger-attach" {
  name = "${var.aws_iam_policy_attachment_log}"
  roles      = [aws_iam_role.tutorial_lambda_role.name]
  policy_arn = "${aws_iam_policy.tutorial_apiconnector_lambda_logging.arn}"
}












