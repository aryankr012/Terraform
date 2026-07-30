output "dev_details" {
  value = {
    ami       = aws_instance.dev.ami
    public_ip = aws_instance.dev.public_ip
  }
}
