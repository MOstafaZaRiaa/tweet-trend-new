resource "aws_vpc" "my_vpc" {
  cidr_block = "10.1.0.0/16"
   tags = {
    Name = "cicd-vpc"  
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = var.az  
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}


resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.1.25.0/24"
  availability_zone       = var.az  
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet_2"
  }
}


resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}



resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Access"
  vpc_id =  aws_vpc.my_vpc.id
  
  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
    description      = "Jenkins-port"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-port"

  }
}



module "sgs" {
    source = "../sg_eks"
    vpc_id     =     aws_vpc.my_vpc.id
}
/*
module "eks" {
    source = "../eks"
    vpc_id     =     aws_vpc.my_vpc.id
    subnet_ids = [aws_subnet.public_subnet.id,aws_subnet.public_subnet_2.id]
    sg_ids = module.sgs.security_group_public
}*/