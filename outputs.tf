# vpn gateway id
output "vpn_gateway_id" {
  description = "[vpn gateway id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway#id)"
  value       = join("", aws_vpn_gateway.this.*.id)
}
