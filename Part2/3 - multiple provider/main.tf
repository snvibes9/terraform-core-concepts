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

provider "aws" {
  region = "ap-southeast-1"
  alias  = "sing"

}

resource "aws_vpc" "my_vpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }

}

resource "aws_vpc" "my_vpc2" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.sing

  tags = {
    Name = "my-vpc-sing"
  }

}