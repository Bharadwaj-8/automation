variable "private_subnets" {
  description = "creating private subnets"
  type = list(string)
}

variable "public_subnets" {
    description = "creating public subnets"
    type = list(string)
  
}

variable "private_route_table_id" {
  type = string
}

variable "public_route_table_id" {
  type = string
}