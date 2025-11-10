terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

# ✅ AWS Provider Configuration
provider "aws" {
  region  = "ap-southeast-2"
  profile = "default"   # Use credentials configured via `aws configure`
}

# ✅ Variable for Instance Names
variable "instance_names" {
  type    = list(string)
  default = ["jenkins", "APPSERVER-1", "APPSERVER-2", "Monitoring-server"]
}

# ✅ Create EC2 Instances
resource "aws_instance" "one" {
  count                     = length(var.instance_names)
  ami                       = "ami-03c7b1a0c7cc99160"
  instance_type             = "t2.micro"
  key_name                  = "poy"
  vpc_security_group_ids    = ["sg-0ace683866cedd2f2"]

  tags = {
    Name = var.instance_names[count.index]
  }
}
