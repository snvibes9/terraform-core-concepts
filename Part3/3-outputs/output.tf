output "pub_ip" {
    value = aws_instance.ec2.public_ip
  
}

output "pri_ip" {
    value = aws_instance.ec2.private_ip
  
}