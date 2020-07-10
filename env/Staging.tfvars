region      = "ap-south-1"
environment = "Staging"
aws_profile = "staging"
project     = "DemoProject"
ansible_host_label = "WebServer"

vpc = {
  name       = "VPC"
  cidr_block = "10.101.0.0/16"
}
#Internet Gateway
igw_name = "IGW"

#Elastic IP Address
EIPs = [
  {
    name = "EIP1a"
  },
  {
    name = "EIP1b"
  }
]

#NAT Gateway
NATGateways = [
  {
    name = "NATGateway1a"
  },
  {
    name = "NATGateway1b"
  }
]

public_subnets = [
  {
    name              = "PublicSubnet1a"
    cidr_block        = "10.101.1.0/24"
    availability_zone = "ap-south-1a"
    #map_public_ip_on_launch = true
  },
  {
    name              = "PublicSubnet1b"
    cidr_block        = "10.101.2.0/24"
    availability_zone = "ap-south-1b"
    #map_public_ip_on_launch = true
  }
]

private_subnets = [
  {
    name                    = "PrivateSubnet1a"
    cidr_block              = "10.101.3.0/24"
    availability_zone       = "ap-south-1a"
    map_public_ip_on_launch = false
  },
  {
    name                    = "PrivateSubnet1b"
    cidr_block              = "10.101.4.0/24"
    availability_zone       = "ap-south-1b"
    map_public_ip_on_launch = false
  }
]

private_subnet_route_tables = [
  {
    name = "PrivateSubnetRT1"
  },
  {
    name = "PrivateSubnetRT2"
  }
]

public_subnet_route_tables = [
  {
    name = "PublicRT"
  }
]

peerconnection_name = "PeerConnection"

PublicSecurityGrp_egress = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

PrivateSecurityGrp_egress = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]


PublicInstances = [
  {
    name                        = "JumpServer"
    ami                         = "ami-0123b531fc646552f" #Ubuntu Server 18.04 LTS (HVM)
    availability_zone           = "ap-south-1a"
    instance_type               = "t2.micro"
    key_name                    = "terraform-demo"
    associate_public_ip_address = true
    user_data                   = "./modules/user-data/user-data-phpapp.sh"
  },
  {
    name                        = "DBServer"
    ami                         = "ami-0123b531fc646552f" #Ubuntu Server 18.04 LTS (HVM)
    availability_zone           = "ap-south-1b"
    instance_type               = "t2.micro"
    key_name                    = "terraform-demo"
    associate_public_ip_address = true
    user_data                   = "./modules/user-data/user-data-mysql.sh"
  }
]

PrivateInstances = [
  {
    name                        = "AWSWEBPri1a"
    ami_name                    = "Packer_UbuntuApachePhp"
    availability_zone           = "ap-south-1a"
    instance_type               = "t2.micro"
    key_name                    = "terraform-demo"
    associate_public_ip_address = false
  },
  {
    name                        = "AWSWEBPri1b"
    ami_name                    = "Packer_UbuntuApachePhp"
    availability_zone           = "ap-south-1b"
    instance_type               = "t2.micro"
    key_name                    = "terraform-demo"
    associate_public_ip_address = false
  }
]

LoadBalancerName = "LoadBalancer"

TargetGroupNames = [
  {
    name = "User-Service"
  },
  {
    name = "Dashboard-Service"
  }
]

AlbForwardRules = [
	{
		  name = "user"
		  priority  = 90
		  type = "forward"
		  field = "path-pattern"
		  values = "/user*"
	},
	{
		  name = "dashboard"
		  priority  = 100
		  type = "forward"
		  field = "path-pattern"
		  values = "/dashboard*"
	}
]

Route53zone_id   = "Z01418562DXE85D5O1NQN"

DomainAliases = [
  {
    DomainName = "staging.edulakanti.info"
  }/*,
  {
    DomainName = "www.edulakanti.info"
  }*/
]