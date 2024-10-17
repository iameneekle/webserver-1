# Create a VPC
resource "aws_vpc" "test-web-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }
}

#create two private subnets
resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.test-web-vpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "private-sn1"
  }
}
resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.test-web-vpc.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.2.0/24"

  tags = {
    Name = "private-sn2"
  }
}

#Create 2 public subnets
resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.test-web-vpc.id
  availability_zone = "us-east-1c"
  cidr_block        = "10.0.3.0/24"

  tags = {
    Name = "public-sn1"
  }
}
resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.test-web-vpc.id
  availability_zone = "us-east-1d"
  cidr_block        = "10.0.4.0/24"

  tags = {
    Name = "public-sn2"
  }
}