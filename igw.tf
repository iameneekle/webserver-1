resource "aws_internet_gateway" "web-test-igw" {
  vpc_id = aws_vpc.test-web-vpc.id

  tags = {
    Name = "test-igw"
  }
}