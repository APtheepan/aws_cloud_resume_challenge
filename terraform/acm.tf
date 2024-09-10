resource "aws_acm_certificate" "cert" {
  domain_name       = "resume.teepstech.com"
  validation_method = "DNS"
 

}




data "aws_acm_certificate" "cert" {
  depends_on = [aws_acm_certificate.cert]
  domain = "resume.teepstech.com"
  statuses = ["ISSUED"]
  
}



/*
output "acm_certificate_cname_records" {
  value = [for record in aws_acm_certificate.cert.domain_validation_options : {
    cname_name  = record.resource_record_name
    cname_value = record.resource_record_value
  }]
}
*/