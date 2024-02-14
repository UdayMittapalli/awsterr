resource "aws_vpc" "test_vpc" {
  cidr_block           = "10.50.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "test_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.50.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.50.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_subnet"
  }
}
resource "aws_subnet" "public1_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.50.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "public1_subnet"
  }
}
resource "aws_subnet" "private1_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.50.4.0/24"
  availability_zone = "us-east-1d"

  tags = {
    Name = "private1_subnet"
  }
}


