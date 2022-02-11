 lambda_sms_api_connector = "intl-reg-tutorial-outgoing-api-connector"
 outgoing_connector_sms_sqs = "intl-reg-tutorial-outgoing-api-connector-sqs"
 lambda_outgoing_api_connector = "intl-reg-tutorial-outgoing-api-connector"
 aws_region ="us-east-1"
 jar_name = "aws_practice002_rds-1.0-SNAPSHOT.jar"

 tutorial_app_env = "dev"
 tutorial_app = "tutorial-sms-api-dev"
 tutorial_app_stage ="v1"
 Name = "tutorial"
 vpc_id ="vpc-0bfadc20b37b4d4f1"
 subnet_ids = ["subnet-05a4c87f5334cffe6"]
 security_group_ids = ["sg-0d77a1d99cc216c92"]
# web_acl_arn = "arn:aws:wafv2:us-east-1:700876845544:regional/webacl/aws-apigateway-webacl-external-block-dev-us-east-1-v1/a1b2c3d4-5678-90ab-cdef-EXAMPLE11111"
 client_account ="700876845544"
# vpc endpoint is required
 vpc_endpoint = ""
# its not vpc id but subnet id may be
 vpc_ids = ["172.31.0.0/16"]
 s3_attachment_bucket ="intl-reg-tutorial-attachments-s3-dev"
 s3_lambda_bucket = "intl-reg-tutorial-attachments-s3-dev"
 api_gateway_name = "intl-reg-send-sms-dev"
 aws_iam_role = "intl-reg-tutorial-api-connector-iam-role-dev"
 aws_iam_sqs_policy = "intl-reg-tutorial-api-connector-iam-sqs-policy"
 aws_iam_log_policy = "intl-reg-tutorial-api-connector-iam-log-policy"
 aws_iam_policy_attachment = "intl-reg-tutorial-api-connector-iam-policy-attachment"
 aws_iam_policy_attachment_log = "intl-reg-tutorial-api-connector-iam-policy-attachment-log"