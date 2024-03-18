output "private_route_table_id" {
  value = aws_route_table.private_route_table.id
  description = "I am creating private route table id"
}

output "public_route_table_id" {
    value = aws_route_table.public_route_table.id
    description = "I am creating public route table id "
  
}