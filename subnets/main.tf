resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnets)
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnets)
  vpc_id = var.vpc_id
  cidr_block = var.private_subnets[count.index]
  availability_zone = var.availability_zone
  map_public_ip_on_launch = false

 
  
}