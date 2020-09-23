variable "enabled" {
  default     = true
  description = "Set to `false` to prevent the module from creating resources"
  type        = bool
}

variable "name" {
  default     = null
  description = "[Resource name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn#name)"
  type        = string
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "vpc_id" {
  type        = string
  description = "[VPC id for VPN Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway#vpc_id)"
}

variable "amazon_side_asn" {
  description = "[Autonomous System Number (ASN) for the Amazon side of the VPN gateway.](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway#amazon_side_asn)"
  default     = 64512
}

variable "bgp_asn" {
  description = "[customer gateway Border Gateway Protocol (BGP) Autonomous System Number (ASN)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway#bgp_asn)"
  default     = 65000
}

variable "ip_address" {
  type        = string
  description = "[customer gateway internet routable external interface IP address](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway#ip_address)"
}

variable "route_table_ids" {
  type        = list(string)
  description = "[vpn gateway route propagation route tables ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway_route_propagation#route_table_id)"
  default     = []
}

variable "static_routes_only" {
  type        = bool
  description = "[vpn connection static routes only. Static routes must be used for devices that do NOT support BGP](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#static_routes_only)"
  default     = false
}

variable "destination_cidr_blocks" {
  type        = list(string)
  description = "vpn connection route destination cidr block for static routes. Routes to destinations will be propagated to the route tables defined in `route_table_ids`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection_route#destination_cidr_block)"
  default     = []
}

variable "tunnel1_inside_cidr" {
  type        = string
  description = "[vpn connection CIDR block of the inside IP addresses for the first VPN tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel1_inside_cidr)"
  default     = null
}

variable "type" {
  type        = string
  description = "[customer gateway type](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway#type)"
  default     = "ipsec.1"
}

variable "tunnel2_inside_cidr" {
  type        = string
  description = "[vpn connection CIDR block of the inside IP addresses for the second VPN tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel2_inside_cidr)"
  default     = null
}

variable "tunnel1_preshared_key" {
  type        = string
  description = "[vpn connection preshared key of the first VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero. Allowed characters are alphanumeric characters, periods(.) and underscores(_)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel1_preshared_key)"
  default     = null
}

variable "tunnel2_preshared_key" {
  type        = string
  description = "[vpn connection preshared key of the second VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero. Allowed characters are alphanumeric characters, periods(.) and underscores(_)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel2_preshared_key)"
  default     = null
}

variable "transit_gateway_id" {
  type        = string
  description = "[vpn connection transit gateway id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#transit_gateway_id)"
  default     = null
}
