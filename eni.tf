#Create a network interface with an ip in the public subnets created

resource "aws_network_interface" "web-server-NI" {
  subnet_id       = aws_subnet.public-subnet-1.id
  private_ips     = ["10.0.3.10"]
  security_groups = [aws_security_group.allow_web.id]

  #   attachment {
  # instance     = aws_instance.test.id
  # device_index = 1
  #   }
}

resource "aws_network_interface" "web-server-NI2" {
  subnet_id       = aws_subnet.public-subnet-2.id
  private_ips     = ["10.0.4.51"]
  security_groups = [aws_security_group.allow_web.id]

  #   attachment {
  # instance     = aws_instance.test.id
  # device_index = 1
  #   }
}

#Assign an elastic IP to the network interface

resource "aws_eip" "one" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.web-server-NI.id
  associate_with_private_ip = "10.0.3.10"
  depends_on                = [aws_internet_gateway.web-test-igw, aws_instance.web-test-faith] # Ensures Creation of the instance and Internet gateway is completed before elastic IP is attached to the server
}

resource "aws_eip" "two" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.web-server-NI2.id
  associate_with_private_ip = "10.0.4.51"
  depends_on                = [aws_internet_gateway.web-test-igw]
}