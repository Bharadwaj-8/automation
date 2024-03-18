# Allocate Elastic IP for NAT Gateway
resource "aws_eip" "testing_elastic_ip" {
  vpc = true
}