variable "ec2_ami" {
    type = string
    default = "ami-08cd358d745620807"
  
}

variable "aws_region" {
  type = string
  default = "ap-southeast-1"
}

variable "ec2_instance_type" {
  type = string
  default = "t2.micro"
}