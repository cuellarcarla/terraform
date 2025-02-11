variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1" 
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidr" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets_cidr" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
}

variable "db_name" {
  description = "Database name for MySQL"
  type        = string
}

variable "db_username" {
  description = "Database username for MySQL"
  type        = string
}

variable "db_password" {
  description = "Database password for MySQL"
  type        = string
}

variable "domain_name" {
  description = "Domain name for DNS record"
  type        = string
}