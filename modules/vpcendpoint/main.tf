resource "aws_vpc_endpoint" "api_gw_endpoint" {
  service_name = "com.amazonaws.us-east-1.execute-api"
  vpc_id       = "${var.vpc_id}"
  vpc_endpoint_type = "interface"
  private_dns_enabled = false
  subnet_ids = "${var.subnet_ids}"
  security_group_ids = "${var.security_group_ids}"
  tags = {
    Name = "${var.tutorial_sbu}-${var.intl_region}"
    tutorial_app= "${var.tutorial_app}"
    tutorial_sbu="${var.tutorial_sbu}"
    intl_country="${var.intl_country}"
    intl_region="${var.intl_region}"
    tutorial_env="${var.tutorial_app_env}"
  }
}