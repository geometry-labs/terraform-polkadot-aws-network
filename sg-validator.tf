module "validator_sg" {
  source      = "github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v3.2.0"
  name        = var.validator_sg_name
  description = "All traffic"

  create = local.validator_enabled

  vpc_id = module.vpc.vpc_id
  tags = merge({
    Name : var.validator_sg_name
  }, var.tags)

  ingress_with_cidr_blocks = concat(
    concat(
      # static rules
      [
        {
          from_port   = 30333
          to_port     = 30333
          protocol    = "tcp"
          description = ""
          cidr_blocks = "0.0.0.0/0"
        },
        {
          from_port   = 51820
          to_port     = 51820
          protocol    = "udp"
          description = ""
          cidr_blocks = "0.0.0.0/0"
        },
        ], [
        # dynamic rules based on Polkadot network
        for network in local.network_settings : {
          from_port   = network["api_health"]
          to_port     = network["api_health"]
          protocol    = "tcp"
          description = "Health Check - ${network["name"]}"
          cidr_blocks = "0.0.0.0/0"
      }],
      [
        for network in local.network_settings : {
          from_port   = network["json_rpc"]
          to_port     = network["json_rpc"]
          protocol    = "tcp"
          description = "JSON RPC - ${network["name"]}"
          cidr_blocks = "0.0.0.0/0"
      }],
      [
        for network in local.network_settings : {
          from_port   = network["ws_rpc"]
          to_port     = network["ws_rpc"]
          protocol    = "tcp"
          description = "WS RPC - ${network["name"]}"
          cidr_blocks = "0.0.0.0/0"
      }],
    ), local.ssh_enabled ? [] :
    [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        description = "Security group for ssh access from coporate ip"
        cidr_blocks = var.ssh_inbound_cidr_blocks
  }], )

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = -1
      description = "Egress access open to all"
      cidr_blocks = "0.0.0.0/0"
  }, ]
}
