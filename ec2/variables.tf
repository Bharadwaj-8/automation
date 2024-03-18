variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "azs" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "private_ip" {
  type = string
}

variable "eip_id" {
  type = string
  default = ""
}

variable "subnet_id" {
  type = string
}

