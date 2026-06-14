# Terraform Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Provider-1 
provider "aws" {
  region = "us-east-1"
}

# Resource Block to Create VPC in ap-south-1 which uses default provider
resource "aws_vpc" "my-vpc-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "terra-vpc"
    
  }
}