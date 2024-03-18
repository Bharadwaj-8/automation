variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "availability_zone" {
  type = string
}

variable "vpc_enable_dns_hostnames" {
  type = string
}

variable "vpc_instance_tenancy" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "map_public_ip_on_launch" {
  type = bool
}


variable "type" {
  type = string
}