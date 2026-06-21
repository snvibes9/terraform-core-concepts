locals {
    project = "Armageddon"

    common_tags = {
        project = local.project
        env     = "dev"
    }
}

resource "random_id" "suffix" {
    byte_length = 4
  
}

resource "aws_s3_bucket" "mys3bucket" {
    bucket = "my-dapp-bucket-${local.project}-${random_id.suffix.hex}"

    tags = merge(local.common_tags, {
        Name = "s3-bucket"
    })  
}

# Ec2 Instance

data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "ec2" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"

    tags = merge(local.common_tags, {
        Name = "web"
    })
}

# VPC

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = merge(local.common_tags, {
        Name = "terra-vpc"
    })
}

