ubuntu@ip-10-0-7-26:~/reto-05-terraform$ terraform plan -out aespa.tfplan -lock=false

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # module.efs.data.aws_iam_policy_document.policy[0] will be read during apply
  # (config refers to values not yet known)
 <= data "aws_iam_policy_document" "policy" {
      + id                        = (known after apply)
      + json                      = (known after apply)
      + minified_json             = (known after apply)
      + override_policy_documents = []
      + source_policy_documents   = []

      + statement {
          + actions   = [
              + "*",
            ]
          + effect    = "Deny"
          + resources = [
              + (known after apply),
            ]
          + sid       = "NonSecureTransport"

          + condition {
              + test     = "Bool"
              + values   = [
                  + "false",
                ]
              + variable = "aws:SecureTransport"
            }

          + principals {
              + identifiers = [
                  + "*",
                ]
              + type        = "AWS"
            }
        }
      + statement {
          + actions   = [
              + "elasticfilesystem:ClientMount",
              + "elasticfilesystem:ClientRootAccess",
              + "elasticfilesystem:ClientWrite",
            ]
          + effect    = "Allow"
          + resources = [
              + (known after apply),
            ]
          + sid       = "NonSecureTransportAccessedViaMountTarget"

          + condition {
              + test     = "Bool"
              + values   = [
                  + "true",
                ]
              + variable = "elasticfilesystem:AccessedViaMountTarget"
            }

          + principals {
              + identifiers = [
                  + "*",
                ]
              + type        = "AWS"
            }
        }
    }

  # module.efs.aws_efs_backup_policy.this[0] will be created
  + resource "aws_efs_backup_policy" "this" {
      + file_system_id = (known after apply)
      + id             = (known after apply)

      + backup_policy {
          + status = "ENABLED"
        }
    }

  # module.efs.aws_efs_file_system.this[0] will be created
  + resource "aws_efs_file_system" "this" {
      + arn                     = (known after apply)
      + availability_zone_id    = (known after apply)
      + availability_zone_name  = (known after apply)
      + creation_token          = (known after apply)
      + dns_name                = (known after apply)
      + encrypted               = true
      + id                      = (known after apply)
      + kms_key_id              = (known after apply)
      + name                    = (known after apply)
      + number_of_mount_targets = (known after apply)
      + owner_id                = (known after apply)
      + performance_mode        = (known after apply)
      + size_in_bytes           = (known after apply)
      + tags                    = {
          + "Name" = "wordpress-efs"
        }
      + tags_all                = {
          + "Name" = "wordpress-efs"
        }
      + throughput_mode         = "bursting"

      + protection (known after apply)
    }

  # module.efs.aws_efs_file_system_policy.this[0] will be created
  + resource "aws_efs_file_system_policy" "this" {
      + bypass_policy_lockout_safety_check = false
      + file_system_id                     = (known after apply)
      + id                                 = (known after apply)
      + policy                             = (known after apply)
    }

  # module.efs.aws_efs_mount_target.this["0"] will be created
  + resource "aws_efs_mount_target" "this" {
      + availability_zone_id   = (known after apply)
      + availability_zone_name = (known after apply)
      + dns_name               = (known after apply)
      + file_system_arn        = (known after apply)
      + file_system_id         = (known after apply)
      + id                     = (known after apply)
      + ip_address             = (known after apply)
      + mount_target_dns_name  = (known after apply)
      + network_interface_id   = (known after apply)
      + owner_id               = (known after apply)
      + security_groups        = (known after apply)
      + subnet_id              = (known after apply)
    }

    # module.efs.aws_efs_mount_target.this["1"] will be created
    + resource "aws_efs_mount_target" "this" {
        + availability_zone_id   = (known after apply)
        + availability_zone_name = (known after apply)
        + dns_name               = (known after apply)
        + file_system_arn        = (known after apply)
        + file_system_id         = (known after apply)
        + id                     = (known after apply)
        + ip_address             = (known after apply)
        + mount_target_dns_name  = (known after apply)
        + network_interface_id   = (known after apply)
        + owner_id               = (known after apply)
        + security_groups        = (known after apply)
        + subnet_id              = (known after apply)
        }

    # module.efs.aws_efs_mount_target.this["2"] will be created
    + resource "aws_efs_mount_target" "this" {
        + availability_zone_id   = (known after apply)
        + availability_zone_name = (known after apply)
        + dns_name               = (known after apply)
        + file_system_arn        = (known after apply)
        + file_system_id         = (known after apply)
        + id                     = (known after apply)
        + ip_address             = (known after apply)
        + mount_target_dns_name  = (known after apply)
        + network_interface_id   = (known after apply)
        + owner_id               = (known after apply)
        + security_groups        = (known after apply)
        + subnet_id              = (known after apply)
        }

    # module.efs.aws_efs_mount_target.this["3"] will be created
    + resource "aws_efs_mount_target" "this" {
        + availability_zone_id   = (known after apply)
        + availability_zone_name = (known after apply)
        + dns_name               = (known after apply)
        + file_system_arn        = (known after apply)
        + file_system_id         = (known after apply)
        + id                     = (known after apply)
        + ip_address             = (known after apply)
        + mount_target_dns_name  = (known after apply)
        + network_interface_id   = (known after apply)
        + owner_id               = (known after apply)
        + security_groups        = (known after apply)
        + subnet_id              = (known after apply)
        }

    # module.efs.aws_security_group.this[0] will be created
    + resource "aws_security_group" "this" {
        + arn                    = (known after apply)
        + description            = "Managed by Terraform"
        + egress                 = (known after apply)
        + id                     = (known after apply)
        + ingress                = (known after apply)
        + name                   = "wordpress-efs"
        + name_prefix            = (known after apply)
        + owner_id               = (known after apply)
        + revoke_rules_on_delete = true
        + tags_all               = (known after apply)
        + vpc_id                 = (known after apply)
        }

    # module.frontend["frontend-1"].aws_instance.this[0] will be created
    + resource "aws_instance" "this" {
        + ami                                  = "ami-04b4f1a9cf54c11d0"
        + arn                                  = (known after apply)
        + associate_public_ip_address          = (known after apply)
        + availability_zone                    = (known after apply)
        + cpu_core_count                       = (known after apply)
        + cpu_threads_per_core                 = (known after apply)
        + disable_api_stop                     = (known after apply)
        + disable_api_termination              = (known after apply)
        + ebs_optimized                        = (known after apply)
        + enable_primary_ipv6                  = (known after apply)
        + get_password_data                    = false
        + host_id                              = (known after apply)
        + host_resource_group_arn              = (known after apply)
        + iam_instance_profile                 = (known after apply)
        + id                                   = (known after apply)
        + instance_initiated_shutdown_behavior = (known after apply)
        + instance_lifecycle                   = (known after apply)
        + instance_state                       = (known after apply)
        + instance_type                        = "t2.micro"
        + ipv6_address_count                   = (known after apply)
        + ipv6_addresses                       = (known after apply)
        + key_name                             = "vockey"
        + monitoring                           = false
        + outpost_arn                          = (known after apply)
        + password_data                        = (known after apply)
        + placement_group                      = (known after apply)
        + placement_partition_number           = (known after apply)
        + primary_network_interface_id         = (known after apply)
        + private_dns                          = (known after apply)
        + private_ip                           = (known after apply)
        + public_dns                           = (known after apply)
        + public_ip                            = (known after apply)
        + secondary_private_ips                = (known after apply)
        + security_groups                      = (known after apply)
        + source_dest_check                    = true
        + spot_instance_request_id             = (known after apply)
        + subnet_id                            = (known after apply)
        + tags                                 = {
            + "Name" = "frontend-1"
            + "Role" = "wordpress-frontend"
            }
        + tags_all                             = {
            + "Name" = "frontend-1"
            + "Role" = "wordpress-frontend"
            }
        + tenancy                              = (known after apply)
        + user_data                            = (known after apply)
        + user_data_base64                     = (known after apply)
        + user_data_replace_on_change          = false
        + volume_tags                          = {
            + "Name" = "frontend-1"
            }
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + credit_specification {}

      + ebs_block_device (known after apply)

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "optional"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)

      + timeouts {}
    }

  # module.frontend["frontend-2"].aws_instance.this[0] will be created
  + resource "aws_instance" "this" {
      + ami                                  = "ami-04b4f1a9cf54c11d0"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "vockey"
      + monitoring                           = false
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "frontend-2"
          + "Role" = "wordpress-frontend"
        }
      + tags_all                             = {
          + "Name" = "frontend-2"
          + "Role" = "wordpress-frontend"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + volume_tags                          = {
          + "Name" = "frontend-2"
        }
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + credit_specification {}

      + ebs_block_device (known after apply)

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "optional"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)

      + timeouts {}
    }

  # module.haproxy.aws_instance.this[0] will be created
  + resource "aws_instance" "this" {
      + ami                                  = "ami-04b4f1a9cf54c11d0"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = true
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "vockey"
      + monitoring                           = false
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "haproxy-lb"
          + "Role" = "load-balancer"
        }
      + tags_all                             = {
          + "Name" = "haproxy-lb"
          + "Role" = "load-balancer"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + volume_tags                          = {
          + "Name" = "haproxy-lb"
        }
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + credit_specification {}

      + ebs_block_device (known after apply)

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "optional"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)

      + timeouts {}
    }

  # module.mysql.aws_instance.this[0] will be created
  + resource "aws_instance" "this" {
      + ami                                  = "ami-04b4f1a9cf54c11d0"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "vockey"
      + monitoring                           = false
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "mysql-db"
          + "Role" = "mysql-database"
        }
      + tags_all                             = {
          + "Name" = "mysql-db"
          + "Role" = "mysql-database"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "0b208aff4eaa9b8e789bb7d91b82c9d6ae562701"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + volume_tags                          = {
          + "Name" = "mysql-db"
        }
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + credit_specification {}

      + ebs_block_device (known after apply)

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "optional"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)

      + timeouts {}
    }

  # module.security_groups.aws_security_group.this_name_prefix[0] will be created
  + resource "aws_security_group" "this_name_prefix" {
      + arn                    = (known after apply)
      + description            = "Security groups for WordPress infrastructure"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "wordpress-sg-"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "wordpress-sg"
        }
      + tags_all               = {
          + "Name" = "wordpress-sg"
        }
      + vpc_id                 = (known after apply)

      + timeouts {
          + create = "10m"
          + delete = "15m"
        }
    }

  # module.security_groups.aws_security_group_rule.egress_with_cidr_blocks[0] will be created
  + resource "aws_security_group_rule" "egress_with_cidr_blocks" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + description              = "Allow all outbound traffic"
      + from_port                = 0
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "-1"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 0
      + type                     = "egress"
    }

  # module.security_groups.aws_security_group_rule.ingress_with_cidr_blocks[0] will be created
  + resource "aws_security_group_rule" "ingress_with_cidr_blocks" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + description              = "HTTP access"
      + from_port                = 80
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 80
      + type                     = "ingress"
    }

  # module.security_groups.aws_security_group_rule.ingress_with_cidr_blocks[1] will be created
  + resource "aws_security_group_rule" "ingress_with_cidr_blocks" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + description              = "SSH access"
      + from_port                = 22
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 22
      + type                     = "ingress"
    }

  # module.security_groups.aws_security_group_rule.ingress_with_source_security_group_id[0] will be created
  + resource "aws_security_group_rule" "ingress_with_source_security_group_id" {
      + description              = "HTTP access from HAProxy"
      + from_port                = 80
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 80
      + type                     = "ingress"
    }

  # module.security_groups.aws_security_group_rule.ingress_with_source_security_group_id[1] will be created
  + resource "aws_security_group_rule" "ingress_with_source_security_group_id" {
      + description              = "SSH access from HAProxy"
      + from_port                = 22
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 22
      + type                     = "ingress"
    }

  # module.security_groups.aws_security_group_rule.ingress_with_source_security_group_id[2] will be created
  + resource "aws_security_group_rule" "ingress_with_source_security_group_id" {
      + description              = "NFS access from frontend instances"
      + from_port                = 2049
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 2049
      + type                     = "ingress"
    }

  # module.security_groups.aws_security_group_rule.ingress_with_source_security_group_id[3] will be created
  + resource "aws_security_group_rule" "ingress_with_source_security_group_id" {
      + description              = "MySQL access from frontend instances"
      + from_port                = 3306
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 3306
      + type                     = "ingress"
    }

  # module.vpc.aws_default_network_acl.this[0] will be created
  + resource "aws_default_network_acl" "this" {
      + arn                    = (known after apply)
      + default_network_acl_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + tags                   = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-default"
        }
      + tags_all               = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-default"
        }
      + vpc_id                 = (known after apply)

      + egress {
          + action          = "allow"
          + from_port       = 0
          + ipv6_cidr_block = "::/0"
          + protocol        = "-1"
          + rule_no         = 101
          + to_port         = 0
            # (1 unchanged attribute hidden)
        }
      + egress {
          + action          = "allow"
          + cidr_block      = "0.0.0.0/0"
          + from_port       = 0
          + protocol        = "-1"
          + rule_no         = 100
          + to_port         = 0
            # (1 unchanged attribute hidden)
        }

      + ingress {
          + action          = "allow"
          + from_port       = 0
          + ipv6_cidr_block = "::/0"
          + protocol        = "-1"
          + rule_no         = 101
          + to_port         = 0
            # (1 unchanged attribute hidden)
        }
      + ingress {
          + action          = "allow"
          + cidr_block      = "0.0.0.0/0"
          + from_port       = 0
          + protocol        = "-1"
          + rule_no         = 100
          + to_port         = 0
            # (1 unchanged attribute hidden)
        }
    }

  # module.vpc.aws_default_route_table.default[0] will be created
  + resource "aws_default_route_table" "default" {
      + arn                    = (known after apply)
      + default_route_table_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + route                  = (known after apply)
      + tags                   = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-default"
        }
      + tags_all               = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-default"
        }
      + vpc_id                 = (known after apply)

      + timeouts {
          + create = "5m"
          + update = "5m"
        }
    }

  # module.vpc.aws_default_security_group.this[0] will be created
  + resource "aws_default_security_group" "this" {
      + arn                    = (known after apply)
      + description            = (known after apply)
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-default"
        }
      + tags_all               = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-default"
        }
      + vpc_id                 = (known after apply)
    }

  # module.vpc.aws_eip.nat[0] will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-us-west-1a"
        }
      + tags_all             = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-us-west-1a"
        }
      + vpc                  = (known after apply)
    }

  # module.vpc.aws_internet_gateway.this[0] will be created
  + resource "aws_internet_gateway" "this" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc"
        }
      + tags_all = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc"
        }
      + vpc_id   = (known after apply)
    }

  # module.vpc.aws_nat_gateway.this[0] will be created
  + resource "aws_nat_gateway" "this" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-us-west-1a"
        }
      + tags_all                           = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-us-west-1a"
        }
    }

  # module.vpc.aws_route.private_nat_gateway[0] will be created
  + resource "aws_route" "private_nat_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + nat_gateway_id         = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route.public_internet_gateway[0] will be created
  + resource "aws_route" "public_internet_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route_table.private[0] will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-private"
        }
      + tags_all         = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-private"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table.public[0] will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-public"
        }
      + tags_all         = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-public"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[0] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[1] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[2] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[3] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[0] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[1] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_subnet.private[0] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-west-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-private-us-west-1a"
        }
      + tags_all                                       = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-private-us-west-1a"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.private[1] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-west-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.4.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-private-us-west-1b"
        }
      + tags_all                                       = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-private-us-west-1b"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.private[2] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-west-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.5.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-private-us-west-1a"
        }
      + tags_all                                       = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-private-us-west-1a"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.private[3] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-west-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.6.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-private-us-west-1b"
        }
      + tags_all                                       = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-private-us-west-1b"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[0] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-west-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-public-us-west-1a"
        }
      + tags_all                                       = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-public-us-west-1a"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[1] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-west-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-public-us-west-1b"
        }
      + tags_all                                       = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc-public-us-west-1b"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_vpc.this[0] will be created
  + resource "aws_vpc" "this" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc"
        }
      + tags_all                             = {
          + "Environment" = "wordpress"
          + "Name"        = "wordpress-vpc"
        }
    }

Plan: 43 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + efs_dns_name         = (known after apply)
  + frontend_private_ips = [
      + (known after apply),
      + (known after apply),
    ]
  + haproxy_public_ip    = (known after apply)
  + mysql_endpoint       = (known after apply)
  + mysql_private_ip     = (known after apply)
  + wordpress_url        = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: aespa.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "aespa.tfplan"
ubuntu@ip-10-0-7-26:~/reto-05-terraform$

terraform apply "aespa.tfplan"
