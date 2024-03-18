output "gateway_id" {
  value = aws_nat_gateway.testing[*].id
  description = "The ID of the NAT Gateway"
}