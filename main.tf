
provider "aws" {
region = "ap-southeast-2"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-03c7b1a0c7cc99160"
instance_type = "t2.micro"
key_name = "poy"
vpc_security_group_ids = ["sg-0ace683866cedd2f2"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "APPSERVER-1", "APPSERVER-2", "Monitoring server"]
}
