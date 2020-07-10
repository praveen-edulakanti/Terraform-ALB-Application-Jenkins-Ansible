output "nat_gateway_ids" {
    value = aws_nat_gateway.NATGateway.*.id
}

output "public_subnet_ids" {
    value = aws_subnet.public_subnet.*.id
}

output "private_subnet_ids" {
    value = aws_subnet.private_subnet.*.id
}

output "publicsubnetroutetable_ids" {
	value = aws_route_table.public_subnet_route_table[0].id
}

output "privatesubnetroutetable_ids" {
	value = aws_route_table.private_subnet_route_table.*.id
}
