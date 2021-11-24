resource "aws_instance" "ubuntu" {
  ami           = "ami-0629230e074c580f2"
  instance_type = "t2.micro"
  subnet_id = "subnet-008dfa04dc603a5d7"
}
