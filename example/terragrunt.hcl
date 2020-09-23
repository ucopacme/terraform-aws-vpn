inputs = {
  ip_address         = "1.2.3.4"
  vpc_id             = "vpc-12abcd34"
  transit_gateway_id = "tgw-123a4bcd567e8f90g"
  enabled            = "true"
  name = join("-", [local.application, local.environment, "vpn"
  ])
  tags = {
    "ucop:application" = local.application
    "ucop:createdBy"   = local.createdBy
    "ucop:environment" = local.environment
    "ucop:group"       = local.group
    "ucop:source"      = local.source
  }
}

locals {
  application = "wheres-my-super-suit"
  createdBy   = "edna.mode@incredibl.es"
  environment = "prod"
  group       = "incredibles"
  source      = "https://github.com/ucopacme/terraform-aws-vpn.git"
}

terraform {
  source = "./.."
}
