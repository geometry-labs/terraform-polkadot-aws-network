

output "api_security_group_id" {
  value = module.api_node_sg.this_security_group_id
}

output "validator_security_group_id" {
  value = module.validator_sg.this_security_group_id
}

#####
# VPC
#####
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnet_cidr_blocks" {
  value = module.vpc.public_subnets_cidr_blocks
}

output "private_subnets_cidr_blocks" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "azs" {
  value = module.vpc.azs
}
