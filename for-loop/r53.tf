resource "aws_route53_record" "roboshop" {
    #count = 10
    for_each = aws_instance.terraform
    zone_id = var.zone_id
    name    = "${each.key}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [each.value.private_ip]
    allow_overwrite = true 

}

# resource "aws_route53_record" "frontend" {
#     count = 
#     zone_id = var.zone_id
#     name    = 
#     type    = "A"
#     ttl     = 1
#     records = [.public_ip]
#     allow_overwrite = true 

# }

