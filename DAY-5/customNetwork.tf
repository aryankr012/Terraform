resource "aws_vpc" "customVPC" {
  cidr_block = "10.0.0.0/25"

  tags = {
    Name = "Custom VPC Terraform"
  }
}

resource "aws_subnet" "custom_subnet" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = "10.0.0.0/28"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.customVPC.id

  tags = {
    Name = "IG"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.customVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.custom_subnet.id
  route_table_id = aws_route_table.public_rt.id
}