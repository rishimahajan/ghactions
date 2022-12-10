variable "vpc_cidr_block" {
  type = string
  description = "VPC CIDR block"
}

variable "anywhere" {
  type = string
  default = "0.0.0.0/0"
}

variable "vpc_name" {
  type = string
  description = "VPC name"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

#variable "subnet_count" {
#  type = number
#  description = "Number of subnets"
#}

variable "web_subnet_cidr_private" {
  type = list(any)
  description = "Private subnet CIDR blocks list"
}


variable "app_subnet_cidr_private" {
  type = list(any)
  description = "Private subnet CIDR blocks list"
}

variable "db_subnet_cidr_private" {
  type = list(any)
  description = "Private subnet CIDR blocks list"
}


variable "lb_subnet_cidr_public" {
  type = list(any)
  description = "Private subnet CIDR blocks list"
}

variable "azs" {
  type        = list(any)
  description = "VPC CIDR block"

}

variable "subnet_name_prefix" {
  type = string
  default = "subnet"
  description = "Prefix to generate subnet names"
}

variable "enable_nat_gateway" {
  type = bool
  default = false
  description = "Whether to create NAT Gateway"
}

variable "enable_internet_gateway" {
  type = bool
  default = false
  description = "Whether to create Internet Gateway"
}
