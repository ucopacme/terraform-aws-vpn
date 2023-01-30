/**
 * # terraform aws vpn module for transit gw
 *
 * this module creates AWS vpn for transit gateways
 *
 * * [customer gateway](https://www.terraform.io/docs/providers/aws/r/customer_gateway.html)
 * * [vpn connection](https://www.terraform.io/docs/providers/aws/r/vpn_connection.html)
 *
 * proudly built in Oakland, California by [UCOP ACME Org](https://github.com/ucopacme), patent pending
 *
 */
resource "aws_customer_gateway" "this" {
  bgp_asn    = var.bgp_asn
  count      = var.enabled ? 1 : 0
  ip_address = var.ip_address
  tags       = merge(var.tags, tomap({"Name" = var.name}))
  type       = var.type
}

resource "aws_vpn_connection" "this" {
  count                 = var.enabled ? 1 : 0
  customer_gateway_id   = join("", aws_customer_gateway.this.*.id)
  static_routes_only    = var.static_routes_only
  tags                  = merge(var.tags, tomap({"Name" = var.name}))
  type                  = var.type
  transit_gateway_id    = var.transit_gateway_id
  tunnel1_inside_cidr   = var.tunnel1_inside_cidr
  tunnel2_inside_cidr   = var.tunnel2_inside_cidr
  tunnel1_preshared_key = var.tunnel1_preshared_key
  tunnel2_preshared_key = var.tunnel2_preshared_key
}
