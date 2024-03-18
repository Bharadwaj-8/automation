# Create an Internet Gateway
resource "aws_internet_gateway" "Testing" {
  vpc_id = var.vpc_id
}