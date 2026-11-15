variable "instances" {
    default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
  
}

variable "zone_id" {
    default = "Z03636913QJEOCADGO5S1"
  
}

variable "domain_name" {
    default = "reddy25.shop"
  
}