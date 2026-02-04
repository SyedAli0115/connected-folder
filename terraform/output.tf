output "ec2_name" {
  value = aws_instance.web.tags
}

output "public_ip" {
  value = aws_instance.web.public_ip
}