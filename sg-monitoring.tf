//
//module "monitoring_sg" {
//  source      = "github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v3.2.0"
//  name        = var.monitoring_sg_name
//  description = "All traffic"
//
//  create = local.monitoring_enabled
//
//  vpc_id = module.vpc.vpc_id
//  tags = merge({
//    Name : var.monitoring_sg_name
//  }, var.tags)
//
//  ingress_with_cidr_blocks = concat([{
//    from_port   = 80
//    to_port     = 80
//    protocol    = "tcp"
//    description = "http ingress"
//    cidr_blocks = "0.0.0.0/0" # TODO: Fix this
//    }], local.ssh_enabled ? [] : [{
//    from_port   = 22
//    to_port     = 22
//    protocol    = "tcp"
//    description = "Security group for ssh access from coporate ip"
//    cidr_blocks = var.ssh_inbound_cidr_blocks
//  }])
//
//  ingress_cidr_blocks = local.consul_enabled ? [module.vpc.vpc_cidr_block] : []
//  ingress_rules       = local.consul_enabled ? ["consul-tcp", "consul-serf-wan-tcp", "consul-serf-wan-udp", "consul-serf-lan-tcp", "consul-serf-lan-udp", "consul-dns-tcp", "consul-dns-udp"] : []
//
//  egress_with_cidr_blocks = [{
//    from_port   = 0
//    to_port     = 65535
//    protocol    = -1
//    description = "Egress access open to all"
//    cidr_blocks = "0.0.0.0/0"
//  }, ]
//}