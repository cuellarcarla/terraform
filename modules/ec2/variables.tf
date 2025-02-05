variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "VPC Security Group IDs"
  type        = list(string)
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "user_data" {
  description = "User data script"
  type        = string
}
