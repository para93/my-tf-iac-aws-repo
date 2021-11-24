resource "aws_instance" "ubuntu" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
  subnet_id = "subnet-013ko113cee1f7798"
}
