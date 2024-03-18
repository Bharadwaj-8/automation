resource "aws_instance" "ec2_instances" {

    ami           = var.ami_id
    instance_type = var.instance_type
    availability_zone = var.azs
    subnet_id     = var.subnet_id
    private_ip    = var.private_ip
    
    key_name               = aws_key_pair.this.key_name
    tags = {
    Name = var.name
    }

    
}
