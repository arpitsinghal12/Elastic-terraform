provider "aws" {

 region = var.region
}

module "elastic_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "elastic"
  description = "Security group for user-service for kubernetes for custom ports"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 20
      to_port     = 50000
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "ec2_cluster_master" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"
  name                   = var.name_master 
  instance_count         = var.instance_count_master 
  ami                    = var.ami_master 
  instance_type          = var.instance_type 
  key_name               = var.key_name 
  monitoring             = true
  vpc_security_group_ids = ["sg-056ddde7adbd69310","${module.elastic_sg.this_security_group_id}"]
  subnet_id              = var.subnet_id

tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_cluster_slave" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"
  name                   = var.name_slave
  instance_count         = var.instance_count_slave
  ami                    = var.ami_slave
  instance_type          = var.instance_type 
  key_name               = var.key_name 
  monitoring             = true
  vpc_security_group_ids = ["sg-056ddde7adbd69310","${module.elastic_sg.this_security_group_id}"]
  subnet_id              = var.subnet_id

tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

