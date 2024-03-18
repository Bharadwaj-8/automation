provider "aws" {
  region = "ap-south-1" # Replace with your desired region
}




module "vpc" {
  source                   = "./vpc"
  vpc_cidr_block           = var.vpc_cidr
  vpc_enable_dns_hostnames = var.vpc_enable_dns_hostnames
  vpc_instance_tenancy     = var.vpc_instance_tenancy
}

# # This instance is for public CIDR blocks
# module "Public_subnets" {
#   count                    = length(var.public_subnets)
#   index                    = count.index
#   source                   = "./subnets"
#   type                     = "Public"
#   vpc_id                   = module.vpc.my_vpc_id
#   subnet_cidr_block        = var.public_subnets[count.index]
#   azs                      = var.azs[count.index]
#   vpc_cidr_block           = var.vpc_cidr
#   vpc_enable_dns_hostnames = var.vpc_enable_dns_hostnames
#   vpc_instance_tenancy     = var.vpc_instance_tenancy
#   map_public_ip_on_launch  = true
# }

# This instance is for private CIDR blocks
# module "Private_subnets" {
#   count                    = length(var.public_subnets)
#   index                    = count.index
#   source                   = "./subnets"
#   type                     = "Private"
#   vpc_id                   = module.vpc.my_vpc_id
#   subnet_cidr_block        = var.private_subnets[count.index]
#   azs                      = var.azs[count.index]
#   vpc_cidr_block           = var.vpc_cidr
#   vpc_enable_dns_hostnames = var.vpc_enable_dns_hostnames
#   vpc_instance_tenancy     = var.vpc_instance_tenancy
#   map_public_ip_on_launch  = false
# }

module "subnets" {
  source = "./subnets"
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  vpc_cidr_block = var.vpc_cidr
  vpc_id = module.vpc.my_vpc_id
  vpc_enable_dns_hostnames = var.enable_dns_hostnames
  vpc_instance_tenancy = var.vpc_instance_tenancy
  type = var.instance_tenancy
}

module "igw" {
  source = "./internet_gateway"
  vpc_id = module.vpc.my_vpc_id
}

module "eip" {
  source = "./elastic_ip"
}

module "nat" {
  source        = "./NAT_Gateway"
  count = length(var.public_subnets)
  public_subnet = var.public_subnets
 # elasticIp_id = module.elastic_ip.aws_elasticIP
   elasticIp_id  = module.eip.aws_elasticIP
}

module "route_table" {
  source = "./route_table"
  internet_gateway_id = module.igw.internet_gateway_id
  vpc_id = module.vpc.my_vpc_id
 
}
module "route_table_association" {
  count = length(var.public_subnets)
  source = "./route_table_association"
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  public_route_table_id = module.route_table.public_route_table_id
  private_route_table_id = module.route_table.private_route_table_id
}


# output "first_subnet" {
#   value = module.Private_subnets[0].subnet[0]
# }
module "ec2_instances" {
  count = length(var.instances) // Assuming var.instances determines the number of instances
  source = "./ec2"
  name = var.instances[count.index].name
  azs = var.instances[count.index].azs
  ami_id = data.aws_ami.ubuntu_22_04.id
  instance_type = var.instances[count.index].instance_type
  private_ip = var.instances[count.index].private_ip
  vpc_id = module.vpc.my_vpc_id
  eip_id = var.instances[count.index].eip_id
  subnet_id = module.subnets.private_subnet_ids[count.index]
}



module "s3" {
  source = "./s3"
  s3_bucket_name = var.s3_bucket_name
}

module "ecr" {
  source = "./ecr"
  ecr_repository_name = var.ecr_repository_name
  
}
# module "ecs" {
#   source = "./ecs"
#   vpc_id = module.vpc.my_vpc_id
#   //alb-sg_id = module.alb.alb-sg
#   private_subnet_id = module.subnets.private_subnets[*].id
# }

# module "my_alb" {
#   source = "./alb"  
#   vpc_id = module.vpc.my_vpc_id
#   Public_subnets_id = module.subnets.Public_subnets.*.id
# }

