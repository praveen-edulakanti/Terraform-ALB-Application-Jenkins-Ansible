output "public_securityGrp" {
    value = aws_security_group.PublicSecurityGrp.id
}

output "private_securityGrp" {
    value = aws_security_group.PrivateSecurityGrp.id
}

output "loadbalancer_securityGrp" {
    value = aws_security_group.LoadBalSecurityGrp.id
}

