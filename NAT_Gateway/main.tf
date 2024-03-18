# Create a NAT Gateway
resource "aws_nat_gateway" "testing" {
  count = length(var.public_subnet)
  allocation_id = var.elasticIp_id
  subnet_id     = var.public_subnet[count.index]

  tags = {
    Name = "example-ngw"
  }
}

