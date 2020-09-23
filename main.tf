/**
 * # terraform aws vpn module
 *
 * this module creates AWS vpn
 * * [vpn gateway](https://www.terraform.io/docs/providers/aws/r/vpn_gateway.html)
 * * [customer gateway](https://www.terraform.io/docs/providers/aws/r/customer_gateway.html)
 * * [vpn connection](https://www.terraform.io/docs/providers/aws/r/vpn_connection.html)
 * * [optional vpn gateay route propagation](https://www.terraform.io/docs/providers/aws/r/vpn_gateway_route_propagation.html)
 * * [optional vpn connection route](https://www.terraform.io/docs/providers/aws/r/vpn_connection_route.html)
 *
 * proudly built in Oakland, California by [UCOP ACME Org](https://github.com/ucopacme), patent pending
 *
 */

resource "aws_vpn_gateway" "this" {
  count           = var.enabled ? 1 : 0
  vpc_id          = var.vpc_id
  amazon_side_asn = var.amazon_side_asn
  tags            = merge(var.tags, map("Name", var.name))
}

resource "aws_customer_gateway" "this" {
  count      = var.enabled ? 1 : 0
  bgp_asn    = var.bgp_asn
  ip_address = var.ip_address
  type       = var.type
  tags       = merge(var.tags, map("Name", var.name))
}

resource "aws_vpn_connection" "this" {
  count                 = var.enabled ? 1 : 0
  vpn_gateway_id        = join("", aws_vpn_gateway.this.*.id)
  customer_gateway_id   = join("", aws_customer_gateway.this.*.id)
  type                  = "ipsec.1"
  static_routes_only    = var.static_routes_only
  transit_gateway_id    = var.transit_gateway_id
  tunnel1_inside_cidr   = var.tunnel1_inside_cidr
  tunnel2_inside_cidr   = var.tunnel2_inside_cidr
  tunnel1_preshared_key = var.tunnel1_preshared_key
  tunnel2_preshared_key = var.tunnel2_preshared_key
  tags                  = merge(var.tags, map("Name", var.name))
}

resource "aws_vpn_gateway_route_propagation" "this" {
  count          = var.enabled ? length(var.route_table_ids) : 0
  vpn_gateway_id = join("", aws_vpn_gateway.this.*.id)
  route_table_id = element(var.route_table_ids, count.index)
}

resource "aws_vpn_connection_route" "this" {
  count                  = var.enabled && var.static_routes_only ? length(var.destination_cidr_blocks) : 0
  vpn_connection_id      = join("", aws_vpn_connection.this.*.id)
  destination_cidr_block = element(var.destination_cidr_blocks, count.index)
}
