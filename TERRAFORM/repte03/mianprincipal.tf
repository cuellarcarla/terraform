# main.tf

provider "aws" {
  region = "eu-west-1"
}

# Módulo VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.13.0"

  name = "asixcloud-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a"]
  public_subnets  = ["10.0.1.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.2.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
}

# Módulo EC2 pública (front-end)
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.0"

  name           = "PublicInstance"
  ami            = "ami-0c55b159cbfafe1f0"  # Ejemplo, elige una AMI válida
  instance_type  = "t2.micro"

  subnet_id      = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.security_groups.public_sg_id]

  tags = {
    Name = "wordpress-front-end"
  }
}

# Módulo EC2 privada (back-end)
module "ec2_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.0"

  name           = "PrivateInstance"
  ami            = "ami-0c55b159cbfafe1f0"  # Ejemplo, elige una AMI válida
  instance_type  = "t2.micro"

  subnet_id      = module.vpc.private_subnets[0]
  vpc_security_group_ids = [module.security_groups.private_sg_id]

  tags = {
    Name = "wordpress-back-end"
  }
}

# Security Groups
module "security_groups" {
  source  = "./modules/security_groups"
  vpc_id  = module.vpc.vpc_id
}
