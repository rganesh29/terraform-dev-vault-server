resource "aws_vpc" "demo" {
  cidr_block = var.vpc-cidr
  instance_tenancy = var.vpc-tenancy

  tags = {
    Name = var.vpc-name
  }
}

resource "aws_subnet" "demo" {
  vpc_id = aws_vpc.demo.id
  cidr_block = var.subnet-cidr
  availability_zone = var.subnet-az
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet-name
  }
  depends_on = [ aws_vpc.demo ]
}

resource "aws_internet_gateway" "demo" {
  vpc_id = aws_vpc.demo.id
  tags = {
      Name = var.igw-name
  }
  depends_on = [ aws_vpc.demo ]
}

resource "aws_route_table" "demo" {
  vpc_id = aws_vpc.demo.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo.id
  }

  tags = {
    Name = var.rt-name
  }
  depends_on = [ aws_internet_gateway.demo ]
}

resource "aws_route_table_association" "demo" {
  subnet_id = aws_subnet.demo.id
  route_table_id = aws_route_table.demo.id
  depends_on = [ aws_route_table.demo ]
}
