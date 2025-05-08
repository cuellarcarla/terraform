# Zona alojada en Route 53
resource "aws_route53_zone" "app_zone" {
  name = var.domain_name
  
  tags = {
    Name = "app-zone"
  }
}

# Solicitud de certificado ACM
resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"
  
  tags = {
    Name = "app-cert"
  }
  
  lifecycle {
    create_before_destroy = true
  }
}

# Registros para validación del certificado
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }
  
  zone_id = aws_route53_zone.app_zone.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
}

# Validación del certificado
resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

# Registro A para apuntar el dominio al ALB
resource "aws_route53_record" "app_record" {
  zone_id = aws_route53_zone.app_zone.zone_id
  name    = var.domain_name
  type    = "A"
  
  alias {
    name                   = aws_lb.app_alb.dns_name
    zone_id                = aws_lb.app_alb.zone_id
    evaluate_target_health = true
  }
}