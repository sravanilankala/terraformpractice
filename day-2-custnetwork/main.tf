# create custom VPC
resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "cust_vpc"
    }
}
# create custom public subnet
resource "aws_subnet" "subpub" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "cust-sub-public"
    }
}
# create custom private subnet
resource "aws_subnet" "subpriv" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.2.0/24"
    tags = {
      Name = "cust-sub-private"
   }
}
# create custom internet gateway and attach to VPC
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name = "cust-igw"
    }
}
# create nat gateway
resource "aws_nat_gateway" "nat" {
  connectivity_type = "public"
  subnet_id = aws_subnet.subpub.id
  allocation_id = aws_eip.elasticip.id
  tags = {
    Name = "cust-natgw"
  }
}
# elastic IP allocation
resource "aws_eip" "elasticip" {
  domain = "vpc"
  
}
# create Route table for nat gateway
resource "aws_route_table" "privrt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "cust-rt-priv"
  }
} 
# Route table private subnet assocition
resource "aws_route_table_association" "privsubassoc" {
  subnet_id = aws_subnet.subpriv.id
  route_table_id = aws_route_table.privrt.id
  
}
# create Route table for internet gateway
resource "aws_route_table" "pubrt" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "cust-rt-pub"
    }
}
# Route table public subnet asscoiation
resource "aws_route_table_association" "pubsubassoc" {
    subnet_id = aws_subnet.subpub.id
    route_table_id = aws_route_table.pubrt.id
}
# create custom security group and add rules
resource "aws_security_group" "secgrp" {
    name = "mysg"
    vpc_id = aws_vpc.vpc.id
    description = "Allow SSH traffic"
    tags = {
      Name = "cust-sg"
    }
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0" ]
    }
}
# create public EC2 instacne
resource "aws_instance" "pubec2" {
    ami = var.ami_id
    instance_type = var.instance
    key_name = var.keypair
    vpc_security_group_ids = [aws_security_group.secgrp.id]
    subnet_id = aws_subnet.subpub.id
    associate_public_ip_address = true
    tags = {
      Name = "pub-ec2"
    }
}
# create private EC2 instance
resource "aws_instance" "privec2" {
  ami = var.ami_id
  instance_type = var.instance
  key_name = var.keypair
  vpc_security_group_ids = [aws_security_group.secgrp.id]
  subnet_id = aws_subnet.subpriv.id
  associate_public_ip_address = false
  tags = {
    Name = "priv-ec2"
  }
  
}