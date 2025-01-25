provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "app_sg_2" {
  name        = "app-sg_2"
  description = "Allow HTTP/SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-04b4f1a9cf54c11d0" 
  instance_type = var.instance_type
  key_name      = "github-actions-key"    
  security_groups = [aws_security_group.app_sg_2.name]

  tags = {
    Name = "Frontend-App-Server"
  }
}
