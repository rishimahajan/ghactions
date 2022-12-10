# AWS Provider

provider "aws" {
  region  = var.region
}


terraform {
  required_version = ">=1.3.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
  backend "s3" {
    bucket = "lreevestfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}