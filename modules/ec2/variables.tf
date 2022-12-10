variable "ami" {
  type        = string
  description = "Instance AMI"
}

variable "instance_count" {
  type = number
  description = "Instance count"
}
variable "instance_type" {
  type        = string
  description = "Instance AMI"
}

#variable "ssh_key_name" {
#  type        = string
#  description = "Instance AMI"
#}

variable "vpc_security_group_ids" {
  type = list(string)
  description = "VPC Security group ids"

}
variable "subnet_id" {
  type        = list(string)
  description = "Subnet id"
}

variable "instance_name_prefix" {}