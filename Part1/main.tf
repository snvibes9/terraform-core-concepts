terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.95.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc"{
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
        Name = "Terra-VPC"
    }
}

resource "aws_subnet" "pubsub" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "public-subnet"
    }
  
}

resource "aws_subnet" "prisub" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.2.0/24"

    tags = {
      Name = "private-subnet"
    }
  
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "my-bucket-252525"
    tags = {
      Name = "My bucket-252525"
    }
  
}

  
