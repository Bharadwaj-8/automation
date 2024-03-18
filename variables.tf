variable "environment" {
  description = "The name or label for the environment where the resources will be deployed"
  type        = string
}

variable "region" {
  description = "The AWS region where the resources will be provisioned "
  type        = string
}

variable "profile_name" {
  description = "A unique name or label for the AWS profile, which identifies the infrastructure environment"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the Virtual Private Cloud (VPC) that will be created, specifying the IP address range."
  type        = string
}

variable "enable_dns_hostnames" {
  description = "The CIDR block for the Virtual Private Cloud (VPC) that will be created, specifying the IP address range."
  type        = string
}

variable "instance_tenancy" {
  description = "The CIDR block for the Virtual Private Cloud (VPC) that will be created, specifying the IP address range."
  type        = string
}

variable "root_block_volume_size" {
  description = "The size (in GB) of the root block volume for the instance."
  type        = number
}

variable "public_subnets" {
  description = "A list of subnet configurations, each defining a public subnet, associated private subnets, and availability zone."
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of subnet configurations, each defining a public subnet, associated private subnets, and availability zone."
  type        = list(string)
}

variable "availability_zone" {
  description = "A list of subnet configurations, each defining a public subnet, associated private subnets, and availability zone."
  type        = string
}

variable "vpc_enable_dns_hostnames" {
  type    = bool
  default = false
}

variable "vpc_instance_tenancy" {
  type    = string
  default = "default"
}


variable "instances" {
  description = "A list of instance configurations, specifying the instance type and count for each instance type."
  type = list(object({
    private_ip    = string
    instance_type = string
    name          = string
    azs           = string
    eip_id        = string
  }))

 
}

variable "s3_bucket_name" {
  type = string
}

variable "health_check_path" {
  type = string
}

variable "app_port" {
  type = string
}

variable "ecr_repository_name" {
  type = string
}