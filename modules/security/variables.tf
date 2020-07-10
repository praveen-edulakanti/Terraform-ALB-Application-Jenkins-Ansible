variable "environment" {
    type = string
}

variable "project" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "PublicSecurityGrp_egress" {
	type  = list
}

variable "PrivateSecurityGrp_egress" {
	type  = list
}
