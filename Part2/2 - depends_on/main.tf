terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}

resource "aws_s3_bucket" "mys3bucket" {

  for_each = {
    dev = "my-dapp-bucket"
    qa  = "my-qapp-bucket"
    uat = "my-uapp-bucket"
  }

  bucket = "${each.key}-${each.value}"
  

  tags = {
    Environment = "My-${each.key}"
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
  }
}

resource "aws_vpc" "my_vpc" {
  count      = 2
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-${count.index}"
  }

  depends_on = [
    aws_s3_bucket.mys3bucket
  ]
}


resource "aws_iam_user" "myuser" {
  for_each = toset([
    "TJack",
    "TJames",
    "TDave"
  ])
  name = each.value

  depends_on = [aws_vpc.my_vpc]
}