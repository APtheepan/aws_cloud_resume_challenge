
/*

resource "aws_cloudfront_origin_access_control" "mywebsite_oac" {
  description                       = "Way to send authenticated requests to an Amazon S3 origin"
  name                              = "mywebsite_oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "my_cdn_distribution" {
  depends_on = [aws_cloudfront_origin_access_control.mywebsite_oac, aws_s3_bucket.my_s3bucket, aws_acm_certificate.cert]

  default_root_object = "index.html"
  origin {
    domain_name              = aws_s3_bucket.my_s3bucket.bucket_regional_domain_name
    origin_id                = aws_s3_bucket.my_s3bucket.bucket_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.mywebsite_oac.id
  }
  viewer_certificate {
    cloudfront_default_certificate = true
    acm_certificate_arn            = data.aws_acm_certificate.cert.arn
    ssl_support_method             = "sni-only"

  }

  enabled = true
  aliases = ["teepstech.com"]
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  default_cache_behavior {
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 8640
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.my_s3bucket.bucket_domain_name
    viewer_protocol_policy = "redirect-to-https"
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

  }

}

output "cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.my_cdn_distribution.domain_name
}





*/