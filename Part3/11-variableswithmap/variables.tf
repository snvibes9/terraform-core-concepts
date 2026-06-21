variable "aws_region" {
    type = string
    default = "ap-south-1"
  
}

variable "ec2_ami" {
    type = string
    default = "ami-079b5e5b3971bd10d"
}

variable "ec2_instance_count" {
    type = number
    default = 1
}

variable "ec2_instance_type" {
    type = map(string)
    default = {
      "tiny-apps" = "t3.micro"
      "midsize-apps" = "t3.medium"
      "big-apps" = t3.large
    }
  
}

variable "ec2_instance_tags" {
    type = map(string)
    default = {
      "Name" = "web"
      "env"  = "dev"
    }
}