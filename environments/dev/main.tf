terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.2.0"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0"

  name = "wordpress-vpc"
  cidr = var.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway   = true
  enable_vpn_gateway   = false
  enable_dns_hostnames = true
}

module "security_groups" {
  source = "../../modules/security_groups"

  vpc_id = module.vpc.vpc_id
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "ec2_public" {
  source = "../../modules/ec2"

  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = element(module.vpc.public_subnets, 0)
  vpc_security_group_ids = [module.security_groups.jumphost_sg_id]
  key_name = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y apache2 php php-mysql mysql-client
    sudo systemctl start apache2
    sudo systemctl enable apache2
  EOF
}

module "ec2_private" {
  source = "../../modules/ec2"

  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = element(module.vpc.private_subnets, 0)
  vpc_security_group_ids = [module.security_groups.backend_sg_id]
  key_name = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y mysql-server
    sudo systemctl start mysql
    sudo systemctl enable mysql
    sudo mysql -e "CREATE DATABASE wordpress;"
    sudo mysql -e "CREATE USER 'wordpress'@'%' IDENTIFIED BY 'password';"
    sudo mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';"
    sudo mysql -e "FLUSH PRIVILEGES;"
  EOF
}
