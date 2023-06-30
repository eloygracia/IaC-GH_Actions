provider "aws" {
  region = "eu-west-1"
}

data "template_file" "init" {
  template = file("${path.module}/userdata.sh")
}

resource "aws_instance" "example" {
  ami           = "ami-05432c5a0f7b1bfd0" // Amazon Linux 2023
  instance_type = "t2.micro"
  
  user_data = base64encode(data.template_file.init.rendered)

  tags = {
    Name = "Terraform IaC GitHub Actions"
  }
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
