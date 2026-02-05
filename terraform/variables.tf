variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "Amazon Linux AMI"
  default = "ami-0532be01f26a3de55"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Existing EC2 key pair"
}