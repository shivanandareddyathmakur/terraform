variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
}

variable "project" {
    default = "roboshop"
  
}

variable "environment" {
    default = "dev"
  
}
#we can't refer one varriable in another but locals can
# variable "common_name" {
#     default = "${var.project}-${var.environment}"
  
# }




variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "common_tags" {
    type = map
    default = {
        terraform = "true"
        project = "roboshop"
        environment = "dev"
    }
  
}

variable "sg_name" {
    type = string
    default = "allow-all"
    description = "SG name to attach to EC2 instance"
  
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
  
}

variable "egress_from_port" {
    type = number
    default = 0
  
}

variable "egress_to_port" {
    default = 0
  
}

variable "ingress_from_port" {
    default = 0
  
}

variable "ingress_to_port" {
    default = 0
  
}

variable "protocol" {
    type = string
    default = "-1"
  
}

