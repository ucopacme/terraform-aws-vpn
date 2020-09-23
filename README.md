# terraform aws vpn module

this module creates AWS vpn
* [vpn gateway](https://www.terraform.io/docs/providers/aws/r/vpn_gateway.html)
* [customer gateway](https://www.terraform.io/docs/providers/aws/r/customer_gateway.html)
* [vpn connection](https://www.terraform.io/docs/providers/aws/r/vpn_connection.html)
* [optional vpn gateay route propagation](https://www.terraform.io/docs/providers/aws/r/vpn_gateway_route_propagation.html)
* [optional vpn connection route](https://www.terraform.io/docs/providers/aws/r/vpn_connection_route.html)

proudly built in Oakland, California by [UCOP ACME Org](https://github.com/ucopacme), patent pending

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| amazon\_side\_asn | [Autonomous System Number (ASN) for the Amazon side of the VPN gateway.](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway#amazon_side_asn) | `string` | `64512` | no |
| bgp\_asn | [customer gateway Border Gateway Protocol (BGP) Autonomous System Number (ASN)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway#bgp_asn) | `string` | `65000` | no |
| destination\_cidr\_blocks | vpn connection route destination cidr block for static routes. Routes to destinations will be propagated to the route tables defined in `route_table_ids`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection_route#destination_cidr_block) | `list(string)` | `[]` | no |
| enabled | Set to `false` to prevent the module from creating resources | `bool` | `true` | no |
| ip\_address | [customer gateway internet routable external interface IP address](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway#ip_address) | `string` | n/a | yes |
| name | [Resource name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn#name) | `string` | `null` | no |
| route\_table\_ids | [vpn gateway route propagation route tables ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway_route_propagation#route_table_id) | `list(string)` | `[]` | no |
| static\_routes\_only | [vpn connection static routes only. Static routes must be used for devices that do NOT support BGP](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#static_routes_only) | `bool` | `false` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| transit\_gateway\_id | [vpn connection transit gateway id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#transit_gateway_id) | `string` | `null` | no |
| tunnel1\_inside\_cidr | [vpn connection CIDR block of the inside IP addresses for the first VPN tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel1_inside_cidr) | `string` | `null` | no |
| tunnel1\_preshared\_key | [vpn connection preshared key of the first VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero. Allowed characters are alphanumeric characters, periods(.) and underscores(\_)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel1_preshared_key) | `string` | `null` | no |
| tunnel2\_inside\_cidr | [vpn connection CIDR block of the inside IP addresses for the second VPN tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel2_inside_cidr) | `string` | `null` | no |
| tunnel2\_preshared\_key | [vpn connection preshared key of the second VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero. Allowed characters are alphanumeric characters, periods(.) and underscores(\_)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel2_preshared_key) | `string` | `null` | no |
| type | [customer gateway type](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway#type) | `string` | `"ipsec.1"` | no |
| vpc\_id | [VPC id for VPN Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway#vpc_id) | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpn\_gateway\_id | [vpn gateway id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway#id) |
