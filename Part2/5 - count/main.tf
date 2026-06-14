terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}

# meta-argument
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  count      = 2

  tags = {
    Name = "My-vpc-${count.index}"
  }

}