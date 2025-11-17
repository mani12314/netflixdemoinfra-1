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
  region  = "ap-south-1"
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
  ami                       = "ami-0f71aec9381dcafd1"
  instance_type             = "t2.micro"
  key_name                  = "netfli"
  vpc_security_group_ids    = ["sg-0186aecba26494c25"]

  tags = {
    Name = var.instance_names[count.index]
  }
}
