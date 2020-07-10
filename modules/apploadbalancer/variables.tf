variable "environment" {
    type = string
}

variable "project" {
    type = string
}

variable "public_subnetID" {
	type  = list
}

variable "LoadBalSecurityGrpID" {
    type = string
}

variable "LoadBalancerName" {
  type = string
}

variable "TargetGroupNames" {
	type  = list
}

variable "AlbForwardRules" {
	type  = list
}

variable "vpc_id" {
    type = string
}  

variable "PrivateInstanceIds" {
    type = list
}

