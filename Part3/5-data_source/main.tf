locals {
  common_tags = {
    project = var.project
    environment = var.environment
  }
}

data "aws_vpc" "selected" {
    filter {
      name = "tag:Name"
      values = [var.vpc_name]
    }
  
}

data "aws_availability_zone" "available" {
}

resource "aws_subnet" "subnets" {
    count = 2
    vpc_id = data.aws_vpc.selected.id
    availability_zone = data.aws_availability_zone.available.names[count.index]

    cidr_block = cidrsubnet(
        data.aws_vpc.selected.cidr_block,
        8,
        count.index
    )

    tags = merge(local.common_tags, {
        Name = "${var.project}-${var.environment}-subnet-${count.index}"
    })
  
}

resource "random_id" "suffix" {
    byte_length = 4
  
}

resource "aws_s3_bucket" "bucket" {
    bucket = "${var.project}-${var.environment}-bucket-${random_id.suffix.hex}"

    tags = merge(local.common_tags, {
        Name = "${var.project}-${var.environment}-s3"
    })
  
}

data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "web" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnets[0].id

    tags = merge(local.common_tags, {
        Name = "${var.project}-${var.environment}-web"
    })
  
}