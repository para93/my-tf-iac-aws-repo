provider "aws" {
  region = var.aws_region
}

#Create security group with firewall rules
resource "aws_security_group" "my_security_group" {
  name        = var.security_group
  description = "security group for Ec2 instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = var.security_group
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Tier = "Private"
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}


# Create AWS ec2 instance
resource "aws_instance" "myFirstInstance" {
  vpc_id = data.aws_subnet.selected.vpc_id
  ami           = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  security_groups= [var.security_group]
  vpc_security_group_ids = ["${aws_security_group.my_security_group.id}"]
  subnet_id = "subnet-008dfa04dc603a5d7"
  tags= {
    Name = var.tag_name
  }
}

# Create Elastic IP address
resource "aws_eip" "myFirstInstance" {
  vpc      = true
  instance = aws_instance.myFirstInstance.id
tags= {
    Name = "my_elastic_ip"
  }
}
