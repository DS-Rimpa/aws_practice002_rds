output "vpc_private_id" {
  value = "${aws_vpc_endpoint.api_gw_endpoint.id}"
}