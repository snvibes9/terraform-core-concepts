terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
  
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "11.0.0.0/16"
    tags = {
      Name = "terra-vpc"
      Dept = "dev"
    }
  lifecycle {
    ignore_changes = [ tags ]
  }
}