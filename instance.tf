resource "aws_instance" "web" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = "benz"
  associate_public_ip_address = true

  tags = {
    Name = "WebApp-terraform"
  }
}
resource "aws_instance" "web1" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.private_subnet.id
  key_name                    = "benz"
  associate_public_ip_address = false

  tags = {
    Name = "Web1"
  }
}
