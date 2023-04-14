#Set AWS Provider
#Uses the aws_region variable to set the region parameter
provider "aws" {
  region = var.region 
}

# Create an AWS VPC
resource "aws_vpc" "my-vpc" {
  cidr_block       = var.vpc-cidr-block


  tags = {
    Name = var.vpc-name
  }
}    

# Create first public subnet in the VPC
resource "aws_subnet" "public-subnet1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.public-subnet1-cidr
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = true

  tags = {
    Name = var.public-subnet1-name
  }
}

# Create second public subnet in the VPC
resource "aws_subnet" "public-subnet2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.public-subnet2-cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = true

  tags = {
    Name = var.public-subnet2-name
  }
}

# Create first private subnet in the VPC
resource "aws_subnet" "private-subnet1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.private-subnet1-cidr
  availability_zone       = var.availability_zone1
  #map_public_ip_on_launch = true

  tags = {
    Name = var.private-subnet1-name
  }
}

# Create second private subnet in the VPC
resource "aws_subnet" "private-subnet2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.private-subnet2-cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = true

  tags = {
    Name = var.private-subnet2-name
  }
}


# Create an internet gateway and associate it with the VPC
resource "aws_internet_gateway" "my-internet-gateway" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = var.internet-gateway-name
  }
}

# Create an Elastic IP address
resource "aws_eip" "nat-gateway-eip" {
    depends_on                = [aws_internet_gateway.my-internet-gateway]
    
}

# Create a NAT gateway and associate it with an Elastic IP and a public subnet
resource "aws_nat_gateway" "my-nat-gateway" {
  allocation_id = aws_eip.nat-gateway-eip.id    
  subnet_id     = aws_subnet.public-subnet1.id

  tags = {
    Name = "My-Nat-Gateway"
  }

  depends_on = [aws_internet_gateway.my-internet-gateway] # Make sure the internet gateway is created before creating the NAT gateway
}


resource "aws_route_table" "my-public-rt" {
  vpc_id = aws_vpc.my-vpc.id

  # Create a default route for the internet gateway with destination 0.0.0.0/0
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internet-gateway.id
  }

  tags = {
    Name = "My-Public-Rt"
  }
}

# Creates a private route table with a default route to the NAT gateway
resource "aws_route_table" "my-private-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my-nat-gateway.id
  }

  tags = {
    Name = "My-Private-Rt"
  }
}

# Associates the public route table with the public subnet 1
resource "aws_route_table_association" "my-public-subnet1-rt-associate" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.my-public-rt.id
}

# Associates the public route table with the public subnet 2
resource "aws_route_table_association" "my-public-subnet2-rt-associate" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.my-public-rt.id
}

# Associates the private route table with the private subnet 1
resource "aws_route_table_association" "my-private-subnet1-rt-associate" {
  subnet_id      = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.my-private-rt.id
}

# Associates the private route table with the private subnet 2
resource "aws_route_table_association" "y-private-subnet2-rt-associate" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.my-private-rt.id
}
