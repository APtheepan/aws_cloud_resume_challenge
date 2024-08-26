
provider "cloudflare" {
  # Configuration options
}

/*

# Create a record
resource "cloudflare_record" "certificate_cname" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id         = var.zone_id # Replace with your Cloudflare zone ID
  allow_overwrite = true
  name            = each.value.name
  value           = each.value.record
  ttl             = 60
  type            = each.value.type
}


resource "cloudflare_record" "website" {
  depends_on = [aws_cloudfront_distribution.my_cdn_distribution]
  zone_id    = var.zone_id # Replace with your Cloudflare zone ID
  name       = "@"
  value      = aws_cloudfront_distribution.my_cdn_distribution.domain_name
  ttl        = 60
  type       = "CNAME"

}



*/

