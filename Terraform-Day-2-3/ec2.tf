resource "aws_instance" "Server_aws_1" {
  ami                         = var.ubuntu_old_image
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.my_subnet_1.id
  key_name                    = "jojo"
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.server_sg.id]

  tags = {
    Name = var.name
  }
}

output "public_ip" {
  value = aws_instance.Server_aws_1.public_ip
}