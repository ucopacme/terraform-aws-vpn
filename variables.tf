variable "amazon_side_asn" {
  default     = 64512
  description = "[Autonomous System Number (ASN) for the Amazon side of the VPN gateway.](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway#amazon_side_asn)"
  type        = string
}

variable "bgp_asn" {
  default     = 65000
  description = "[customer gateway Border Gateway Protocol (BGP) Autonomous System Number (ASN)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway#bgp_asn)"
  type        = string
}

variable "destination_cidr_blocks" {
  default     = []
  description = "vpn connection route destination cidr block for static routes. Routes to destinations will be propagated to the route tables defined in `route_table_ids`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection_route#destination_cidr_block)"
  type        = list(string)
}
variable "enabled" {
  default     = true
  description = "Set to `false` to prevent the module from creating resources"
  type        = bool
}

variable "ip_address" {
  description = "[customer gateway internet routable external interface IP address](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway#ip_address)"
  type        = string
}

variable "name" {
  default     = null
  description = "[Resource name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn#name)"
  type        = string
}

variable "route_table_ids" {
  default     = []
  description = "[vpn gateway route propagation route tables ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway_route_propagation#route_table_id)"
  type        = list(string)
}

variable "static_routes_only" {
  default     = false
  description = "[vpn connection static routes only. Static routes must be used for devices that do NOT support BGP](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#static_routes_only)"
  type        = bool
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "transit_gateway_id" {
  default     = null
  description = "[vpn connection transit gateway id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#transit_gateway_id)"
  type        = string
}

variable "tunnel1_inside_cidr" {
  default     = null
  description = "[vpn connection CIDR block of the inside IP addresses for the first VPN tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel1_inside_cidr)"
  type        = string
}

variable "tunnel2_inside_cidr" {
  default     = null
  description = "[vpn connection CIDR block of the inside IP addresses for the second VPN tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel2_inside_cidr)"
  type        = string
}

variable "tunnel1_preshared_key" {
  default     = null
  description = "[vpn connection preshared key of the first VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero. Allowed characters are alphanumeric characters, periods(.) and underscores(_)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel1_preshared_key)"
  type        = string
}

variable "tunnel2_preshared_key" {
  default     = null
  description = "[vpn connection preshared key of the second VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero. Allowed characters are alphanumeric characters, periods(.) and underscores(_)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection#tunnel2_preshared_key)"
  type        = string
}

variable "type" {
  default     = "ipsec.1"
  description = "[customer gateway type](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway#type)"
  type        = string
}

variable "vpc_id" {
  default     = null
  description = "[VPC id for VPN Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway#vpc_id)"
  type        = string
}
