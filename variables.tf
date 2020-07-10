variable "environment" {
  type = string
}

variable "aws_profile" {
  type = string
  default = "default" 
} 

variable "project" {
  type = string
}

variable "ansible_host_label" {
  type = string
  default = "WebServer"
}

variable "region" {
  type = string
}

variable "vpc" {
  type = map
}

variable "igw_name" {
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

variable "peerconnection_name" {
  type = string
}

variable "PublicSecurityGrp_egress" {
  type = list
}

variable "PrivateSecurityGrp_egress" {
  type = list
}

variable "PublicInstances" {
  type = list
}

variable "PrivateInstances" {
  type = list
}

variable "LoadBalancerName" {
  type = string
}

variable "TargetGroupNames" {
  type = list
}

variable "AlbForwardRules" {
  type = list
}

variable "Route53zone_id" {
	type = string
} 

variable "DomainAliases" {
	type = list
} 

/*variable "AutoScalingLaunchconfig" {
	type = map
} 

variable "AutoScalingGrp" {
	type = map
}*/