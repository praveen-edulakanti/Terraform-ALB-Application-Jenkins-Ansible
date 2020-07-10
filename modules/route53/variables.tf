variable "Route53zone_id" {
	type = string
} 

variable "alias" {
  type = object({
    name    = string
    zone_id = string
  })
}

variable "DomainAliases" {
	type = list
} 