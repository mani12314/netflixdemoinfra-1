
provider "aws" {
region = "ap-southeast-2"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-0d53a60306ca7e710"
instance_type = "t2.micro"
key_name = "jekins"
vpc_security_group_ids = ["sg-080a6d0011f38981d"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "APPSERVER-1", "APPSERVER-2", "Monitoring server"]
}
