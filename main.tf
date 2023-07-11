provider "aws" {
region = "eu-west-1"
}

data "template_file" "init" {
template = file("${path.module}/userdata.sh")
}

resource "aws_instance" "instance-2048" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  count                  = 1
  vpc_security_group_ids = ["sg-003af02b9a759e866"]
  key_name               = var.ssh_key
  tags = {
    Name = var.instance_name
    APP  = "vue2048"
  }
}

output "instance_public_ip" {
value = aws_instance.example.public_ip
}
