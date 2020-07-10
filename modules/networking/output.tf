output "vpc_id" {
    value = module.vpc.vpc_id
}

output "internet_gateway_id" {
	value = module.vpc.internet_gateway_id
}

output "nat_gateway_ids" {
	value = module.subnets.nat_gateway_ids
}

output "public_subnet_ids" {
	value = module.subnets.public_subnet_ids
}

output "private_subnet_ids" {
	value = module.subnets.private_subnet_ids
}

output "publicsubnetroutetable_ids" {
	value = module.subnets.publicsubnetroutetable_ids
}

output "privatesubnetroutetable_ids" {
	value = module.subnets.privatesubnetroutetable_ids
}