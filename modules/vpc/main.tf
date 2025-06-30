resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id

  count = 2

  cidr_block              = var.subnet_public[count.index]
  availability_zone       = var.az[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.psb
  }
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id

  count = 2

  cidr_block        = var.subnet_private[count.index]
  availability_zone = var.az[count.index]

  tags = {
    Name = var.privtsb
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.proute
  }
}

