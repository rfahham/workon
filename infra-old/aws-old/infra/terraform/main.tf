terraform {
  required_version = "1.7.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "web" {
  count                  = var.number_instances
  ami                    = var.aws_ami
  instance_type          = var.instance_type
  tags                   = var.instance_tags
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
}

#Generate private key
resource "aws_key_pair" "this" {
  key_name   = "aws-instance-key"
  public_key = file("~/.ssh/authorized_keys")
}

# Get my public ip
data "http" "ip" {
  # url = "https://ipv4.icanhazip.com" quebra de linha
  url = "https://api4.ipify.org"
}

#Security Group Resource
resource "aws_security_group" "security_group" {
  name        = "${var.prefix_name}-sg"
  description = "Allow Inbound Traffic"

  ingress {
    description = "Port 80 from MyIP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${data.http.ip.response_body}/32"]
  }

  ingress {
    description = "Port 443 from MyIP"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${data.http.ip.response_body}/32"]
  }

  ingress {
    description = "Port 9000 from MyIP"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["${data.http.ip.response_body}/32"]
  }

  ingress {
    description = "Port 22 from MyIP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.http.ip.response_body}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}