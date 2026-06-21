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
    type = list(string)
    default = ["t3.micro", "t3.small", "t3.large"]
}