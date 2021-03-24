terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws2"
      version = "= 2.7.0"
    }
  }
}

resource "aws_vpc" "mainsing" {
  cidr_block = var.cidrblock
}