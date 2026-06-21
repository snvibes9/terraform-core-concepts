variable "aws_region" {
    type = string
    default = "ap-southeast-1"
}

variable "project" {
    type = string
    default = "armageddon"
    description = "project name"
}

variable "environment" {
    description = "development environment"
    type = string
    default = "dev"
  
}

variable "vpc_name" {
    description = "VPC Name tag to lookup"
    type = string
    default = "terra-vpc"
  
}

