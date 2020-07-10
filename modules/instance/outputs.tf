output "PrivateInstanceIds" {
    value = aws_instance.PrivateInstance.*.id
}

output "PrivateInstance_ip_addr" {
  value = aws_instance.PrivateInstance.*.private_ip
}

output "PublicInstance_ip_addr" {
  value = aws_instance.PublicInstance.*.public_ip
}
