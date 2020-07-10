output "Environment" {
  value = var.environment
}

output "Region" {
  value = var.region
}

output "Project" {
  value = var.project
}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "vpcName" {
  value = var.vpc.name
}

output "vpcCIDR" {
  value = var.vpc.cidr_block
}

output "InternetGateway" {
  value = var.igw_name
}

output "internet_gateway_id" {
  value = module.networking.internet_gateway_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.networking.private_subnet_ids
}

output "publicsubnetroutetable_ids" {
	value = module.networking.publicsubnetroutetable_ids
}

output "privatesubnetroutetable_ids" {
	value = module.networking.privatesubnetroutetable_ids
}

output "PublicSecurityGrpID" {
  value = module.security.public_securityGrp
}

output "PrivateSecurityGrpID" {
  value = module.security.private_securityGrp
}

output "LoadBalSecurityGrpID" {
  value = module.security.loadbalancer_securityGrp
}

output "PrivateInstanceIds" {
    value = module.instance.PrivateInstanceIds
}

output "AppLoadBalancerURL" {
    value = module.apploadbalancer.route53_alias
}

output "Targetgroup_ids" {
    value = module.apploadbalancer.Targetgroup_ids
}

output "PrivateInstance_ip_addr" {
  value = module.instance.PrivateInstance_ip_addr
}

output "PublicInstance_ip_addr" {
  value = module.instance.PublicInstance_ip_addr
}

output "PublicInstIPAddr1" {
  value = "${element(module.instance.PublicInstance_ip_addr, 0)}"
}

output "PublicInstIPAddr2" {
  value = "${element(module.instance.PublicInstance_ip_addr, 1)}"
}

output "PrivateInstIPAddr1" {
  value = "${element(module.instance.PrivateInstance_ip_addr, 0)}"
}

output "PrivateInstIPAddr2" {
  value = "${element(module.instance.PrivateInstance_ip_addr, 1)}"
}

