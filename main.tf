
provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-051e483428ae60e7d"
instance_type = "t2.micro"
key_name = "mykey"
vpc_security_group_ids = ["sg-0cec4f77ba86c6536"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "APPSERVER-1", "APPSERVER-2", "Monitoring server"]
}
