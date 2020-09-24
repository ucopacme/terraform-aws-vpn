# vpn gateway id
output "aws_customer_gateway_id" {
  description = "[vpn gateway id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway#id)"
  value       = join("", aws_customer_gateway.this.*.id)
}
output "aws_vpn_connection_id" {
  description = "[vpn gateway id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#id)"
  value       = join("", aws_vpn_connection.this.*.id)
}
