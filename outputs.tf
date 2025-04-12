output "ec2_aws_ip" {
  description = ""
  value       = aws_instance.this.public_ip
}