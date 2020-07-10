variable "environment" {
    type = string
}

variable "project" {
    type = string
}

variable accepter_vpc_id{
  type = string
}
variable acceptervpc_cidr{
  type = string
}

variable  privatesubnetroutetable{
 type = list
}

variable  publicsubnetroutetable{
 type = string
}

variable "peerconnection_name" {
  type = string
}