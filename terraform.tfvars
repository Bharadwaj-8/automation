environment            = "development"
region                 = "ap-south-1"
profile_name           = "training"
vpc_cidr               = "192.168.0.0/16"
enable_dns_hostnames   = "true"
instance_tenancy       = "default"
root_block_volume_size = 20
s3_bucket_name = "Testing"
app_port = "80"
health_check_path = "/health"
ecr_repository_name = "testing"
public_subnets = [
  
    "192.168.4.0/24"
]

private_subnets = [
    "192.168.5.0/24",
    "192.168.6.0/24"
]

availability_zone = "ap-south-1" 


# subnet_cnt = length(public_subnets)

instances = [
  {
    name          = "HA-Proxy"
    azs           = "ap-south-1a"
    ami_id        = "data.aws_ami.ubuntu_22_04.id"
    instance_type = "t3.nano"
    private_ip    = "192.168.5.4"
    eip_id        = "aws_eip.haproxy_eip.id"
  },

  {
     name = "Test-1"
     azs = "ap-south-1a"
     ami_id = "data.aws_ami.ubuntu_22_04.id"
     instance_type = "t2.medium"
     private_ip = "192.168.5.5"
     eip_id = "false"
  }
]