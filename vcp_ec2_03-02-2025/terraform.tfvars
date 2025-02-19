# Variables Genéricas
region      = "us-east-1"
environment = "prod"
owners      = "aws"

# Variables de la VPC
name                               = "vpc-terraform" # Sobrescribiendo el nombre definido en el archivo de variables
cidr                               = "10.53.0.0/16"
azs                                = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnets                     = ["10.53.101.0/24", "10.53.102.0/24", "10.53.103.0/24"]
private_subnets                    = ["10.53.1.0/24", "10.53.2.0/24", "10.53.3.0/24"]
database_subnets                   = ["10.53.151.0/24", "10.53.152.0/24", "10.53.153.0/24"]
create_database_subnet_group       = true
create_database_subnet_route_table = true
enable_nat_gateway                 = true
single_nat_gateway                 = true
# Añade estas líneas
instance_type = "t2.micro"
key_name      = "vockey"  # Reemplaza con tu key pair de AWS
