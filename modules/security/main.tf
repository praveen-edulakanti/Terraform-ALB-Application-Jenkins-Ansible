resource "aws_security_group" "PublicSecurityGrp" {
  name        = "PublicSecurityGroup"
  description = "Allow Permission for Public Security Group inbound traffic"
  vpc_id  = var.vpc_id
  
  ingress {
		# TLS (change to whatever ports you need)
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		# Please restrict your ingress to only necessary IPs and ports.
		# Opening to 0.0.0.0/0 can lead to security vulnerabilities.
		cidr_blocks = ["0.0.0.0/0"]
		#add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
	  from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"]
	  #add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
      from_port   = 3306
      to_port     = 3306
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
  
  egress {
    from_port       = lookup(var.PublicSecurityGrp_egress[0], "from_port")
    to_port         = lookup(var.PublicSecurityGrp_egress[0], "to_port")
    protocol        = lookup(var.PublicSecurityGrp_egress[0], "protocol")
    cidr_blocks     = lookup(var.PublicSecurityGrp_egress[0], "cidr_blocks")
  }

  tags = {
    Name = "PublicSecurityGroup"
	Environment = var.environment
    Project = var.project
	Terraformed = "True"
  }
}

resource "aws_security_group" "PrivateSecurityGrp" {
  name        = "PrivateSecurityGroup"
  description = "Allow Permission for Private Security Group inbound traffic"
  vpc_id  = var.vpc_id

  ingress {
		# TLS (change to whatever ports you need)
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		# Please restrict your ingress to only necessary IPs and ports.
		# Opening to 0.0.0.0/0 can lead to security vulnerabilities.
		cidr_blocks = ["0.0.0.0/0"]
		#add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
	  from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"]
	  #add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
      from_port   = 3306
      to_port     = 3306
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
  
  egress {
    from_port       =  lookup(var.PrivateSecurityGrp_egress[0], "from_port")
    to_port         =  lookup(var.PrivateSecurityGrp_egress[0], "to_port")
    protocol        =  lookup(var.PrivateSecurityGrp_egress[0], "protocol")
    cidr_blocks     =  lookup(var.PrivateSecurityGrp_egress[0], "cidr_blocks")
  }

  tags = {
    Name = "PrivateSecurityGroup"
	Environment = var.environment
    Project = var.project
	Terraformed = "True"
  }
}

resource "aws_security_group" "LoadBalSecurityGrp" {
  name        = "LoadBalSecurityGroup"
  description = "Allow Permission for Load Balancer Security Group inbound traffic"
  vpc_id  = var.vpc_id
  
 ingress {
		# TLS (change to whatever ports you need)
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		# Please restrict your ingress to only necessary IPs and ports.
		# Opening to 0.0.0.0/0 can lead to security vulnerabilities.
		cidr_blocks = ["0.0.0.0/0"]
		#add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
	  from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"]
	  #add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
      from_port   = 3306
      to_port     = 3306
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
  
  egress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
        Name = "LoadBalSecurityGroup"
name_prefix = var.environment    
Environment = var.environment
      Project = var.project
	Terraformed = "True"
  }
}