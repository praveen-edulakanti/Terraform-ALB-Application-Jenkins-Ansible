resource "aws_eip" "EIP" {
    vpc   = true
	count = length(var.EIPs)
	
	tags = {
               Name = format("${var.environment}-%s", lookup(var.EIPs[count.index],"name"))
        Environment = var.environment
            Project = var.project
        Terraformed = "True"
    }
}

resource "aws_nat_gateway" "NATGateway" {
          count = length(var.EIPs)
  allocation_id = aws_eip.EIP.*.id[count.index]
  subnet_id     = aws_subnet.public_subnet.*.id[count.index]
  
  tags = {
         Name = format("${var.environment}-%s", lookup(var.NATGateways[count.index], "name"))
	Environment = var.environment
      Project = var.project
	Terraformed = "True"
  }
}

resource "aws_subnet" "public_subnet" {
    count   = length(var.public_subnets)
    vpc_id  = var.vpc_id
    cidr_block = lookup(var.public_subnets[count.index], "cidr_block")
    availability_zone = lookup(var.public_subnets[count.index], "availability_zone")
  
    tags = {
         Name = format("${var.environment}-%s", lookup(var.public_subnets[count.index], "name"))
         Environment = var.environment
         Project = var.project
         Terraformed = "True"
    }
}

resource "aws_subnet" "private_subnet" { 
  count  = length(var.private_subnets)
  vpc_id  = var.vpc_id
  cidr_block = lookup(var.private_subnets[count.index], "cidr_block")
  availability_zone = lookup(var.private_subnets[count.index], "availability_zone")
  
  tags = {
		Name = format("${var.environment}-%s", lookup(var.private_subnets[count.index], "name"))
		Environment = var.environment
        Project = var.project
		Terraformed = "True"
  }
}

resource "aws_route_table" "public_subnet_route_table" {
  
  count  = length(var.public_subnet_route_tables)
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
	gateway_id = var.internet_gateway_id
  }

  tags = {
           Name = format("${var.environment}-%s", lookup(var.public_subnet_route_tables[count.index],"name"))
	Environment = var.environment
        Project = var.project
	Terraformed = "True"
  }
}

resource "aws_route_table_association" "public_subnet_route_table_association" {
           count = length(var.public_subnets)
  subnet_id      =  aws_subnet.public_subnet.*.id[count.index%length(var.public_subnets)]
  route_table_id =  aws_route_table.public_subnet_route_table.*.id[0]
}

resource "aws_route_table" "private_subnet_route_table" {
    count              = length(var.private_subnet_route_tables)
    vpc_id             = var.vpc_id
    route  {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.NATGateway.*.id[count.index]
    }

    tags = {
        Name           = format("${var.environment}-%s", lookup(var.private_subnet_route_tables[count.index],"name")) 
        Environment    = var.environment
               Project = var.project
        Terraformed    = "True"
    }
}

resource "aws_route_table_association" "private_subnet_route_table_association" {
    count          = length(var.private_subnets)
    subnet_id      = aws_subnet.private_subnet.*.id[count.index%length(var.private_subnets)]
    route_table_id = count.index%2 == 0 ? aws_route_table.private_subnet_route_table.*.id[0] : aws_route_table.private_subnet_route_table.*.id[1]

}