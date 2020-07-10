variable "environment" {
    type = string
}

variable "project" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "internet_gateway_id" {
    type = string
}

variable "EIPs" {
	type = list
} 

variable "NATGateways" {
	type = list
}

variable "public_subnets" {
    type = list
}

variable "private_subnets" {
	type = list
}

variable "private_subnet_route_tables" {
    type = list
}

variable "public_subnet_route_tables" {
    type = list
}
