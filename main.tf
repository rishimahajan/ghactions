# main.tf

# VPC
module "vpc" {

  source = "./modules/vpc"

  vpc_name                = var.vpc_name
  vpc_cidr_block          = var.vpc_cidr_block
  azs                     = var.azs
  web_subnet_cidr_private = var.web_subnet_cidr_private
  app_subnet_cidr_private = var.app_subnet_cidr_private
  db_subnet_cidr_private  = var.db_subnet_cidr_private
  lb_subnet_cidr_public   = var.lb_subnet_cidr_public
  enable_nat_gateway      = var.enable_nat_gateway
  enable_internet_gateway = var.enable_internet_gateway

  tags = var.tags
}

# Web Instance
module "web_instance_ec2" {

  source = "./modules/ec2"

  instance_count = var.web_instance_count
  ami            = var.web_instance_ami
  instance_type  = var.web_instance_type
  #subnet_id                   = module.vpc.web_private_subnet_ids
  subnet_id         = module.vpc.lb_public_subnet_ids
  availability_zone = var.web_instance_availability_zone
  vpc_security_group_ids = [module.vpc.lb_security_group_id]
  instance_name_prefix   = var.web_instance_name_prefix

  tags = var.tags

}

# App instance
module "app_instance_ec2" {

  source = "./modules/ec2"

  instance_count = var.app_instance_count
  ami            = var.app_instance_ami
  instance_type  = var.app_instance_type
  #subnet_id                   = module.vpc.app_private_subnet_ids
  subnet_id         = module.vpc.lb_public_subnet_ids
  availability_zone = var.app_instance_availability_zone
  vpc_security_group_ids = [module.vpc.lb_security_group_id]
  instance_name_prefix   = var.app_instance_name_prefix

  tags = var.tags

}

# DB instance
module "db_instance_ec2" {

  source = "./modules/ec2"

  instance_count = var.db_instance_count
  ami            = var.db_instance_ami
  instance_type  = var.db_instance_type
  #subnet_id                   = module.vpc.db_private_subnet_ids
  subnet_id         = module.vpc.lb_public_subnet_ids
  availability_zone = var.db_instance_availability_zone
  vpc_security_group_ids = [module.vpc.lb_security_group_id]
  instance_name_prefix   = var.db_instance_name_prefix

  tags = var.tags
}

# Application load balancer

module "alb" {

  source                 = "./modules/alb"
  alb_name               = var.alb_name
  vpc_security_group_ids = [module.vpc.lb_security_group_id]
  vpc_id                 = module.vpc.vpc_id
  target_id              = join("", module.web_instance_ec2.instance_id)
  subnet_id              = module.vpc.lb_public_subnet_ids
  listener_port          = var.alb_listener_port
  listener_protocol      = var.alb_listener_protocol
  tags                   = var.tags

}

# Route 53 and DNS
module "route53" {
  source = "./modules/route53"

  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
  domain_name  = var.domain_name
}

variable "terraform_backend_s3_bucket" {
  type = string
  description = "S3 bucket to store terraform state"
  default = "lreevestfstate"
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = var.terraform_backend_s3_bucket


#  tags = {
#    Name = var.tags
#  }
}

resource "aws_s3_bucket_acl" "tf_state_bucket_acl" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


output "tf_s3_bucket" {
  value = aws_s3_bucket.tf_state_bucket.bucket_domain_name
}
