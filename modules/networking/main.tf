module "vpc" {
     source = "./modules/vpc"
     environment   = var.environment
     project       = var.project
     vpc           = var.vpc
     igw_name      = var.igw_name
}

module "subnets" {
     source = "./modules/subnets"
     environment   = var.environment
     project       = var.project
     vpc_id        = module.vpc.vpc_id
     EIPs          = var.EIPs
     NATGateways   = var.NATGateways
     private_subnets = var.private_subnets
	public_subnets  = var.public_subnets
     internet_gateway_id          =  module.vpc.internet_gateway_id
     private_subnet_route_tables  =  var.private_subnet_route_tables
	public_subnet_route_tables   =  var.public_subnet_route_tables
}