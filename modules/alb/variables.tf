# variables.tf

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security group id"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "subnet_id" {
  type        = list(string)
  description = "Subnet id of load balancer"
}

variable "alb_name" {
  type        = string
  description = "Name of application load balancer"
}

variable "listener_port" {
  type = string
  description = "ALB listener port"
}

variable "listener_protocol" {
  type = string
  description = "ALB listener protocol"
}

variable "target_id" {
  type        = string
  description = "Id of target instance"
}

variable "enable_deletion_protection" {
  type = bool
  description = "Whether to enable deleteion protection for load balancer"
  default = false
}