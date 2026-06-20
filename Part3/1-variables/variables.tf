variable "ec2_instance_type" {
  type = string
  default = "t2.micro"
}

variable "ec2_ami_id" {
    type = string
    default = "ami-079b5e5b3971bd10d"
  
}

variable "ec2_instance_count" {
    type = number
    default = 1
  
}

variable "aws_region" {
  type = string
  default = "ap-southeast-1"
}