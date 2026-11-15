variable "instances" {
    default = ["mongodb","redis","mysql"]
    # default = {
    #     mongodb = "t3.micro"
    #     redis = "t3.micro"
    #     mysql =  "t3.small"
    # }
    # default = {
    #     mongodb = {
    #         instance_type = "t3.micro"
    #         ami = "other ami id"
    #     }
    #     redis = {
    #         instance_type = "t3.micro"
    #         ami = "other ami id"
    #     }
    #     mysql = {
    #         instance_type = "t3.small"
    #         ami = "other ami id"
    #     }
}


variable "zone_id" {
    default = "Z03636913QJEOCADGO5S1"
  
}

variable "domain_name" {
    default = "reddy25.shop"
  
}