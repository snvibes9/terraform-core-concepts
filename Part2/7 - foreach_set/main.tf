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

resource "aws_iam_user" "users" {
  for_each = toset([
    "TJack",
    "TDave",
    "Tbob"

  ])
  name = each.key

}