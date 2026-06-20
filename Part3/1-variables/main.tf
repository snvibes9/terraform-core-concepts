resource "aws_instance" "ec2" {
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type
    count = var.ec2_instance_count
    tags = {
      Name = "ec2_instance"
    }
  
}