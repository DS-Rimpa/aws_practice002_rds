# state management
terraform {
  backend "s3" {
    bucket = "intl-reg-tutorial-attachments-s3-dev"
    key = "tfstate-tutorialApiConnector/"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "${var.aws_region}"
  version = "~> 2.0"
}