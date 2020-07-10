resource "aws_route53_record" "Route53Name" {
  count   = length(var.DomainAliases)
  zone_id = var.Route53zone_id 
  name    = lookup(var.DomainAliases[count.index], "DomainName")
  type    = "A"

  alias {
    name                   = var.alias.name
    zone_id                = var.alias.zone_id
    evaluate_target_health = true
  }
}

