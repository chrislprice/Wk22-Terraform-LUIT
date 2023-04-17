

resource "aws_security_group" "apache-terra-sg" {
  name   = "apache-terra-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow SSH Connectiviy"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.cidr_ingress_block]
  }

  ingress {
    description = "Allow HTTP Traffic"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.cidr_ingress_block]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-Apache-SG"
  }
}


