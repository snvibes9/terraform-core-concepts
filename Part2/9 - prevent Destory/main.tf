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

resource "aws_vpc" "my-vpc-1" {
  cidr_block = "11.0.0.0/16"
  tags = {
    Name = "terra-vpc"
  }
  lifecycle {
    prevent_destroy = true
  }
}