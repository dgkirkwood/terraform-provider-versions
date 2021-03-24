terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.32.0"
    }
  }
}


resource "aws_vpc" "mainaus" {
  cidr_block = var.cidrblock
}

