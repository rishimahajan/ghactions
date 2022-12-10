# Terraform inputs

###### Region and AZs ###########
# Region
region = "us-east-1"

# Availability zones
azs = ["us-east-1a","us-east-1b"]
#################################


########## Network variables ##################
# VPC name
vpc_name = "vpc"

# VPC CIDR block
vpc_cidr_block = "10.0.0.0/16"

# Whether to enable NAT Gateway
enable_nat_gateway = true

# Whether to enable Internet Gateway
enable_internet_gateway = true


##########################################################################
# Single AZ Deployment

# Private subnet CIDRs
web_subnet_cidr_private = ["10.0.0.0/24"]
app_subnet_cidr_private = ["10.0.1.0/24"]
db_subnet_cidr_private  = ["10.0.2.0/24"]

# Public subnet CIDRs
lb_subnet_cidr_public = ["10.0.3.0/24","10.0.4.0/24" ]
#########################################################################

########## Web instance variables ##################

web_instance_count       = 1
web_instance_name_prefix = "web"
web_instance_ami         = "ami-019928f47d3ff4383"
web_instance_type        = "t3.micro"
web_instance_availability_zone = ""
####################################################

########## App instance variables ##################
app_instance_count       = 1
app_instance_name_prefix = "app"
app_instance_ami         = "ami-019928f47d3ff4383"
app_instance_type        = "t3.micro"
app_instance_availability_zone = ""
####################################################


########## DB instance variables ###################
db_instance_count       = 1
db_instance_name_prefix = "db"
db_instance_ami         = "ami-019928f47d3ff4383"
db_instance_type        = "t3.micro"
db_instance_availability_zone = ""
####################################################


########## Route 53 and DNS variables ##############
domain_name = "www.reevesitsolutions.com"
####################################################


########## Application Load Balancer variables #####
alb_name = "reevesit-alb"
alb_listener_port = "80"
alb_listener_protocol = "HTTP"


###################################################


########## tags ###################################
tags = {
  Environment   = "dev"
  Created_using = "terraform"
}
##################################################
