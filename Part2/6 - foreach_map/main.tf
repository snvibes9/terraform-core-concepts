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

resource "aws_s3_bucket" "my_bucket" {
  for_each = {
    dev = "my-dapp-bucket"
    qa  = "my-qapp-bucket"
    uat = "my-uapp-bucket"
  }
  bucket = "${each.key}-${each.value}"

  tags = {
    Environment = "my-$(each.key)"
    Name        = "${each.key}-${each.value}"
    eachvalue   = each.value


  }


}