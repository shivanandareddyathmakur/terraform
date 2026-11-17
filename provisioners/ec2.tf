resource "aws_instance" "terraform" {
        ami = "ami-0055977a6e828a4f4"
        instance_type = "t3.micro"
        vpc_security_group_ids = [aws_security_group.allow_all.id]

        tags = {
            Name = "terraform-1"
            terraform = "true"
            project = "roboshop"
        }

        provisioner "local-exec" {
          command = "echo ${self.private_ip} > inventory"
          when = create
          on_failure = continue
        }
        provisioner "local-exec" {
          command = "echo instance is destroyed"
          when = destroy
          
        }

        connection {
          type = "ssh"
          user = "ec2-user"
          password = "DevOps321"
          host = self.public_ip
        }
        provisioner "remote-exec" {
          inline = [
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
           ]
          
        }

        provisioner "remote-exec" {
          inline = [
            "sudo systemctl stop nginx",
            "echo 'successfully stopped nginx server' "
           ]
           
          when = destroy
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