# Associate public subnet with public route table
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnets)
  subnet_id      = var.public_subnets[count.index]
  route_table_id = var.public_route_table_id
}


# Associate private subnet with private route table
resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnets)
  subnet_id      = var.private_subnets[count.index]
  route_table_id = var.private_route_table_id
}