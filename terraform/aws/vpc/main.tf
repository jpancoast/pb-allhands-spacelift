provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "pb-all-hands-spacelift"
  }
}

module "vpc" {
  source  = "spacelift.io/jpancoast/pb-spacelift-allhands-vpc/aws"
  version = "0.0.1"
}
