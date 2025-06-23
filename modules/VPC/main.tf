resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.environment}-vpc"
    ENV  = var.environment
  }
}

data "aws_availability_zones" "azs" {}

resource "aws_subnet" "public" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-public-${count.index}"
    ENV  = var.environment
  }
}
