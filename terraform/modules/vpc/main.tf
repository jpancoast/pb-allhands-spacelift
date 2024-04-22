
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "pb-all-hands-spacelift"
  }
}

output "vpc" {
  value = aws_vpc.main
}
