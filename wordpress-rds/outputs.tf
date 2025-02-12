output "rds_endpoint" {
  description = "Endpoint de la base de datos RDS"
  value       = module.rds.db_instance_endpoint
}

output "ec2_public_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = module.ec2.public_ip
}
