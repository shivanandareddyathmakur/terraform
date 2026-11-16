resource "aws_security_group" "allow_all" {
  name        = "allow_all"

  egress {
    from_port        = 0 #from_port 0 to to_port 0 means all ports
    to_port          = 0
    protocol         = "-1" #-1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }
   #block
    dynamic "ingress" {
        for_each = toset(var.ingress_ports)
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

  #without writing a block multiple times we use dynamic loop
#   ingress {
#     from_port        = 22
#     to_port          = 22
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#     ingress {
#     from_port        = 8080
#     to_port          = 8080
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port        = 27017
#     to_port          = 27017
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

  tags = {
    Name = "allow_all"
  }
}