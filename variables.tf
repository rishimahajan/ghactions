# Variables

variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "azs" {
  type        = list(any)
  description = "VPC CIDR block"

}

variable "web_subnet_cidr_private" {
  type        = list(any)
  description = "Private subnet CIDR blocks list"
}


variable "app_subnet_cidr_private" {
  type        = list(any)
  description = "Private subnet CIDR blocks list"
}

variable "db_subnet_cidr_private" {
  type        = list(any)
  description = "Private subnet CIDR blocks list"
}


variable "lb_subnet_cidr_public" {
  type        = list(any)
  description = "Private subnet CIDR blocks list"
}

variable "subnet_name_prefix" {
  type        = string
  default     = "subnet"
  description = "Prefix to generate subnet names"
}

variable "enable_nat_gateway" {
  type        = bool
  default     = false
  description = "Whether to create NAT Gateway"
}


variable "enable_internet_gateway" {
  type        = bool
  default     = false
  description = "Whether to create Internet Gateway"
}

variable "web_instance_ami" {
  type        = string
  description = "AMI"
}

variable "web_instance_type" {
  type        = string
  description = "Web instance type"
}

variable "web_instance_count" {
  type        = number
  description = "Web instance count"
}

variable "web_instance_availability_zone" {
  type        = string
  description = "Web instance AZ"
}

variable "web_instance_name_prefix" {
  type        = string
  description = "Web instance name prefix"
}

# App
variable "app_instance_ami" {
  type        = string
  description = "AMI"
}

variable "app_instance_type" {
  type        = string
  description = "App instance type"
}

variable "app_instance_count" {
  type        = number
  description = "App instance count"
}

variable "app_instance_availability_zone" {
  type        = string
  description = "App instance AZ"
}

variable "app_instance_name_prefix" {
  type        = string
  description = "App instance name prefix"
}

# DB
variable "db_instance_ami" {
  type        = string
  description = "AMI"
}

variable "db_instance_type" {
  type        = string
  description = "DB instance type"
}

variable "db_instance_count" {
  type        = number
  description = "DB instance count"
}

variable "db_instance_availability_zone" {
  type        = string
  description = "DB instance AZ"
}

variable "db_instance_name_prefix" {
  type        = string
  description = "DB instance name prefix"
}

variable "domain_name" {
  type        = string
  description = "Application domain name"
}

variable "alb_name" {
  type        = string
  description = "Name of application laod balancer"
}

variable "alb_listener_port" {
  type = string
  description = "ALB listener port"
}

variable "alb_listener_protocol" {
  type = string
  description = "ALB listener protocol"
}