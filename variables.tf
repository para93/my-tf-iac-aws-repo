variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-2"
}

variable "vpc_id" {
  description = "VPC"
  default     =  "vpc-0dfe935fef5090189"
}

variable "subnet_id" {
  description = "VPC Subnet"
  default     =  "subnet-008dfa04dc603a5d7"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "mchung-dell-pem"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "JenkinsSG"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "my-ec2-instance"
}

variable "ami_id" {
  description = "AMI for Ubuntu Ec2 instance"
  default     = "ami-0629230e074c580f2"
}
