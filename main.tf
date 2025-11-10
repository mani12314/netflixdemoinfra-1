provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0b8d527345fdace59"
  instance_type          = "t2.micro"
  key_name               = "netflix"
  vpc_security_group_ids = ["sg-0de2cffd9b437ba98"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
