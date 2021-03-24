terraform {
  required_providers {
    awsaus = {
      source  = "hashicorp/aws"
      version = "3.32.0"
    }
    awssing = {
      source  = "hashicorp/aws2"
    }
  }
}

provider "awsaus" {
  region = "ap-southeast-2"
}

provider "awssing" {
  region = "ap-southeast-1"
}

locals {
  subnet_ids = toset([
    "10.0.0.0/20",
    "10.20.0.0/20",
  ])
}


module "vpc" {
  for_each = local.subnet_ids
  source = "./modules/vpc"
  cidrblock = each.key
  providers = {
    aws = awsaus
   }
}


module "vpc2" {
  for_each = local.subnet_ids
  source = "./modules/vpc2"
  cidrblock = each.key
  providers = {
    aws = awssing
   }
}