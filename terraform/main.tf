provider "aws" {
  region = "eu-west-3"
}

terraform {
  backend "s3" {
    bucket = "hurtov-oleksii-project-terraform"
    key = "server/terraform.tfstate"
    region = "eu-west-3"
  }
}
#=====================================================

data "aws_ami" "latest_ubuntu_linux" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

#=========================================================
resource "aws_eip" "my_static_ip" {
  instance = aws_instance.WebServer.id
}
resource "null_resource" "connect" {
  provisioner "remote-exec" {
      inline = ["echo hi"]
    connection {
      host = aws_eip.my_static_ip.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("Hurtov-Paris.pem")
    }
  }
}
resource "aws_instance" "WebServer" {
  ami = data.aws_ami.latest_ubuntu_linux.id
  instance_type   = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]
  key_name = var.key_name

  tags = {
    Name = "WebServer"
    Owner = var.owner
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "web" {
  name = "Dynamic Security Group"

  dynamic "ingress" {
    for_each = ["80", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Dynamic SecurityGroup"
    Owner = var.owner
  }
}