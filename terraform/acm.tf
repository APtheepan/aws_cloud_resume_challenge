resource "aws_acm_certificate" "cert" {
  domain_name       = "teepstech.com"
  validation_method = "DNS"

}
/*
data "aws_acm_certificate" "cert_data" {
  depends_on = [aws_acm_certificate.cert]
  domain = "teepstech.com"
  statuses = ["PENDING_VALIDATION"]
}
*/


/*
output "acm_certificate_cname_records" {
  value = [for record in aws_acm_certificate.cert.domain_validation_options : {
    cname_name  = record.resource_record_name
    cname_value = record.resource_record_value
  }]
}
*/