output "ec2_public_ip" {
  sensitive = true
  value     = aws_instance.app_server.public_ip
}