output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

output "nat_gateway_ids" {
    value = module.vpc.natgw_ids
}

output "private_subnets" {
    value = module.vpc.private_subnets
}