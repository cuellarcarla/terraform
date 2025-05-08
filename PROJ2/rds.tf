# Instancia RDS PostgreSQL
resource "aws_db_instance" "app_db" {
  identifier              = var.db_identifier
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "postgres"
  engine_version          = "13.7"
  instance_class          = var.db_instance_class
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  parameter_group_name    = "default.postgres13"
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  skip_final_snapshot     = true  # Para entorno de desarrollo/pruebas
  backup_retention_period = 7     # 7 días de retención de backups
  
  tags = {
    Name = "app-database"
  }
}