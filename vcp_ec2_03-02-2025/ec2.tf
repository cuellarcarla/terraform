# Obtener la última AMI de Ubuntu
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

# Crear Security Group para la EC2
resource "aws_security_group" "ec2_sg" {
  name        = "${var.environment}-${var.name}-ec2-sg"
  description = "Security group for EC2 instance"
  vpc_id      = module.vpc.vpc_id

  # Regla de entrada para SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regla de salida para todo el tráfico
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.environment}-${var.name}-ec2-sg"
    }
  )
}

# Crear instancia EC2
resource "aws_instance" "web" {
  # Usa la AMI más reciente de Ubuntu
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  # Configuración de red
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  
  # Clave SSH
  key_name = var.key_name

  # Etiquetas
  tags = merge(
    local.tags,
    {
      Name = "${var.environment}-${var.name}-ec2"
    }
  )
}
