# Instancia RDS PostgreSQL
resource "aws_db_instance" "app_db" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "17.2-R2"  # Latest version with Extended Support
  instance_class       = "db.t3.micro"
  name                 = "app-db"
  username             = "admin"
  password             = "SecurePassword123!"
  db_subnet_group_name = aws_db_subnet_group.app_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot  = true
  backup_retention_period = 7     # 7 días de retención de backups

  # Enable RDS Extended Support
  enable_performance_insights = true
  enable_iam_database_authentication = true

  tags = {
    Name = "app-database"
  }
}

