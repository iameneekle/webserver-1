# Configure the AWS Provider
provider "aws" {
  version = "~> 5.65"
  region  = "us-east-1"

  #   shared_config_files = "path/config"
  #   shared_credentials_files = "path/credential"
  #   profile = MainUser
}

#Launch a public instance

resource "aws_instance" "web-test-faith" {
  ami               = "ami-0866a3c8686eaeeba"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1c"
  key_name          = "deletesoon"

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.web-server-NI.id
  }

  user_data = <<-EOF
#!/bin/bash
sudo apt update -y
sudo systemctl start apache2
sudo bash -c 'echo "Hello, World" > /var/www/html/index.html'
EOF


  tags = {
    Name = "ubuntu-public"
  }
}