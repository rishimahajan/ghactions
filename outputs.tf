output "web_instance_public_ip" {
  value = module.web_instance_ec2.instance_ip
}

output "web_instance_id" {
  value = module.web_instance_ec2.instance_id
}

output "app_instance_public_ip" {
  value = module.app_instance_ec2.instance_ip
}

output "app_instance_id" {
  value = module.web_instance_ec2.instance_id
}

output "db_instance_public_ip" {
  value = module.db_instance_ec2.instance_ip
}

output "db_instance_id" {
  value = module.db_instance_ec2.instance_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_dns_zone" {
  value = module.alb.alb_zone_id
}


