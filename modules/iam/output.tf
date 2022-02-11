output "iam_role" {
  value = "${aws_iam_role.tutorial_lambda_role.arn}"
}