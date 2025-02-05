module "jumphost_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.0"

  name        = "jumphost-sg"
  vpc_id      = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
  egress_rules        = ["all-all"]
}

module "backend_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.0"

  name        = "backend-sg"
  vpc_id      = var.vpc_id
  computed_ingress_with_source_security_group_id = [
    { rule = "ssh-tcp", source_security_group_id = module.jumphost_sg.security_group_id },
    { from_port = 3306, to_port = 3306, protocol = "tcp", source_security_group_id = module.jumphost_sg.security_group_id }
  ]
  number_of_computed_ingress_with_source_security_group_id = 2
  egress_rules = ["all-all"]
}

output "jumphost_sg_id" {
  value = module.jumphost_sg.security_group_id
}

output "backend_sg_id" {
  value = module.backend_sg.security_group_id
}
