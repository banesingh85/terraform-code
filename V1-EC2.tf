
provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "web-server" {
  ami = "ami-0cc9838aa7ab1dce7"
  instance_type = "t2.micro"
  key_name = "devops"
  security_groups = ["web_server_sg"]
}

resource "aws_security_group" "web_server_sg" {
  name = "web_server_sg"
  description = "SSH Access"

  ingress = {
    description = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress = {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
}

tags = {
  Name = "allow_tls"
 }
}