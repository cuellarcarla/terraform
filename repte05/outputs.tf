# Output para la IP pública del balanceador de carga (HAProxy)
output "haproxy_public_ip" {
  description = "Public IP address of the HAProxy load balancer"
  value       = module.haproxy.public_ip
}

# Output para las IPs privadas de las instancias frontales (WordPress)
output "frontend_private_ips" {
  description = "Private IP addresses of the WordPress frontend instances"
  value       = [for instance in module.frontend : instance.private_ip]
}

# Output para la IP privada de la instancia de MySQL
output "mysql_private_ip" {
  description = "Private IP address of the MySQL instance"
  value       = module.mysql.private_ip
}

# Output para el DNS de EFS
output "efs_dns_name" {
  description = "DNS name of the EFS file system"
  value       = module.efs.dns_name
}

# Output para el endpoint de la base de datos MySQL
output "mysql_endpoint" {
  description = "Endpoint of the MySQL database"
  value       = "${module.mysql.private_ip}:3306"
}

# Output para la URL de WordPress
output "wordpress_url" {
  description = "URL to access WordPress"
  value       = "http://${module.haproxy.public_ip}"
}