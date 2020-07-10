#Creating a peer connection EnvironmentVPC as accepter
resource "aws_vpc_peering_connection" "peerconnection" {
  peer_owner_id =  ""
  peer_vpc_id   =  aws_default_vpc.default.id
  vpc_id        =  var.accepter_vpc_id

 # cidr_block = aws_default_vpc.default.cidr_block 
  auto_accept   = true

  tags = {
    Name = format("${var.environment}-%s", var.peerconnection_name)
  }
}

#Getting details from Default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#creating a Route WITH IN THE PEER CONNECTION
resource "aws_route" "newvpcroute" {
  route_table_id            =  aws_route_table.peerroutetable.id
  destination_cidr_block    = aws_default_vpc.default.cidr_block
  vpc_peering_connection_id =  aws_vpc_peering_connection.peerconnection.id
}

resource "aws_route_table" "peerroutetable" {
  vpc_id = var.accepter_vpc_id
}

#creating a Route is private route TABLES with Destination as Default VPC and Tagget as peerconnection
resource "aws_route" "prisubnets_peer_route" { 

    count = length(var.privatesubnetroutetable)
    route_table_id  = var.privatesubnetroutetable[count.index]
    destination_cidr_block    =   aws_default_vpc.default.cidr_block
    vpc_peering_connection_id =  aws_vpc_peering_connection.peerconnection.id
}

#creating a Route is public route table with Destination as Default VPC and Tagget as peerconnection
resource "aws_route" "pubsubnets_peer_route" { 

    route_table_id  = var.publicsubnetroutetable
    destination_cidr_block    =   aws_default_vpc.default.cidr_block
    vpc_peering_connection_id =  aws_vpc_peering_connection.peerconnection.id
}

#creating a Route is DefaultRoute with Destination as QAVPC and Tagget as peerconnection
resource "aws_route" "default_peer_route" { 

    route_table_id  = aws_default_vpc.default.default_route_table_id
    destination_cidr_block    =  var.acceptervpc_cidr
    vpc_peering_connection_id =  aws_vpc_peering_connection.peerconnection.id
}