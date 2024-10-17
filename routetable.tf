resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.test-web-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web-test-igw.id
  }

  #   route {
  # ipv6_cidr_block        = "::/0"
  # egress_only_gateway_id = aws_internet_gateway.web-test-igw.id
  #   }

  tags = {
    Name = "public-rt"
  }
}

#route table association of the public subnets

resource "aws_route_table_association" "public-rt" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "public-rt2" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-rt.id
}