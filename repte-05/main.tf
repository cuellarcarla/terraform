provider "aws" {
  region = var.aws_region
}

# Módulo de la comunidad para VPC 
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0"

  name = "wordpress-vpc"
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  public_subnets  = var.public_subnets_cidr
  private_subnets = var.private_subnets_cidr

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_vpn_gateway   = false
  enable_dns_hostnames = true

  tags = {
    Environment = "wordpress"
  }
}

# Módulo de la comunidad para Security Groups 
module "security_groups" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.0.0"  

  name        = "wordpress-sg"
  description = "Security groups for WordPress infrastructure"
  vpc_id      = module.vpc.vpc_id

  # Reglas de entrada (ingress) basadas en CIDR
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP access"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH access"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  # Reglas de salida (egress)
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Allow all outbound traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  # Reglas de entrada basadas en otros security groups
  ingress_with_source_security_group_id = [
    {
      from_port                = 80
      to_port                  = 80
      protocol                 = "tcp"
      description              = "HTTP access from HAProxy"
      source_security_group_id = module.security_groups.security_group_id
    },
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      description              = "SSH access from HAProxy"
      source_security_group_id = module.security_groups.security_group_id
    },
    {
      from_port                = 2049
      to_port                  = 2049
      protocol                 = "tcp"
      description              = "NFS access from frontend instances"
      source_security_group_id = module.security_groups.security_group_id
    },
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      description              = "MySQL access from frontend instances"
      source_security_group_id = module.security_groups.security_group_id
    }
  ]
}

# Módulo de la comunidad para EFS
module "efs" {
  source  = "terraform-aws-modules/efs/aws"
  version = "1.2.0"  

  name = "wordpress-efs"

  # Montar EFS solo en las subredes de frontend-1 y frontend-2
  mount_targets = {
    "frontend-1" = {
      subnet_id       = module.vpc.private_subnets[0] # private-us-east-1a
      security_groups = [module.security_groups.security_group_id]
    }
    "frontend-2" = {
      subnet_id       = module.vpc.private_subnets[1] # private-us-east-1b
      security_groups = [module.security_groups.security_group_id]
    }
  }

  # Configuración del grupo de seguridad
  security_group_description = "Security group for EFS"
  security_group_vpc_id      = module.vpc.vpc_id
  security_group_rules = {
    nfs = {
      description = "NFS access from frontend instances"
      cidr_blocks = module.vpc.private_subnets_cidr_blocks
    }
  }
}



# Módulo de la comunidad para HAProxy (EC2 pública) 
module "haproxy" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.0.0" 

  name          = "haproxy-lb"
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.security_groups.security_group_id]
  associate_public_ip_address = true

  tags = {
    Role = "load-balancer"
  }
}

# Módulo de la comunidad para las instancias frontales (WordPress) 
module "frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.0.0"

  for_each = toset(["frontend-1", "frontend-2"])

  name          = each.key
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  # Asignar dinámicamente las subredes privadas
  subnet_id = each.key == "frontend-1" ? module.vpc.private_subnets[0] : module.vpc.private_subnets[1]

  vpc_security_group_ids = [module.security_groups.security_group_id]

  user_data = templatefile("user_data_frontend.sh", {
    efs_dns_name = module.efs.dns_name
  })

  tags = {
    Role = "wordpress-frontend"
  }
}

# Módulo de la comunidad para MySQL (EC2 privada) 
module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.0.0" 

  name          = "mysql-db"
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id              = module.vpc.private_subnets[1]
  vpc_security_group_ids = [module.security_groups.security_group_id]

  user_data = templatefile("user_data_mysql.sh", {
    db_name     = var.db_name,
    db_username = var.db_username,
    db_password = var.db_password,
  })

  tags = {
    Role = "mysql-database"
  }
}
