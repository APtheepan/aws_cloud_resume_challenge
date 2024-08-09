
/*
resource "aws_route53_zone" "my_hosted_zone" {
  name = "aws.teepstech.com"
}



data "aws_route53_zone" "my_hosted_zone" {
  name = "aws.teepstech.com"
}

output "nameservers" {
  value = data.aws_route53_zone.my_hosted_zone.name_servers
}


*/