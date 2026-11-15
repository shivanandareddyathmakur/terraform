resource "aws_instance" "terraform" {
        count = length(var.instances)
        ami = "ami-0055977a6e828a4f4"
        instance_type = "t3.micro"
        vpc_security_group_ids = [aws_security_group.allow_all.id]

        tags = {
            Name = var.instances[count.index]
            terraform = "true"
        }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"

  egress {
    from_port        = 0 #from_port 0 to to_port 0 means all ports
    to_port          = 0
    protocol         = "-1" #-1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_all"
  }
}