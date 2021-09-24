### The Ansible inventory file
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

data "aws_instances" "my_instances" {
  instance_tags = {
    Name   = "WebServer in ASG"
  }
  filter {
    name = "instance-state-code"
    values = ["0","16"]
  }
}


resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  WebServer-ip = data.aws_instances.my_instances.public_ips,
  names = data.aws_instances.my_instances.ids
 }
 )
 filename = "/var/lib/jenkins/inventory"
}