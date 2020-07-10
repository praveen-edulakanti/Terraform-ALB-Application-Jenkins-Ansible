output "route53_alias" {
  value = {
    name    = aws_lb.LoadBalancer.dns_name
    zone_id = aws_lb.LoadBalancer.zone_id
  }
}

output "Targetgroup_ids" {
  value = aws_lb_target_group.TargetGroup.*.arn
}