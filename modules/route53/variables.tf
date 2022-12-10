

variable "domain_name" {
  type = string
  description = "Domain Name"
}

variable "cname_route53_record_type" {
  type = string
  description = "CNAME record type"
  default = "CNAME"
}

variable "cname_route53_record_ttl" {
  type = string
  description = "CNAME record ttl"
  default = "60"
}

variable "alb_dns_name" {
  type = string
  description = "Application load balancer domain name"
}

variable "alb_zone_id" {
  type = string
  description = "Application load balancer zone id"
}