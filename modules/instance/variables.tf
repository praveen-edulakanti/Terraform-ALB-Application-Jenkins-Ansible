variable "environment" {
    type = string
}

variable "project" {
    type = string
}

variable "PublicInstances" {
	type  = list
}

variable "PrivateInstances" {
	type  = list
}

variable "public_subnetID" {
	type  = list
}

variable "private_subnetID" {
	type  = list
}

variable "PublicSecurityGrpID" {
    type = string
}

variable "PrivateSecurityGrpID" {
    type = string
}

