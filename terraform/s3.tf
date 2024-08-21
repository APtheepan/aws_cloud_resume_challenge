

resource "aws_s3_bucket" "my_s3bucket" {
  bucket        = "teepswebucket"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "Cloudresume" {
  bucket = aws_s3_bucket.my_s3bucket.bucket
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.my_s3bucket.bucket
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  # This is required to allow the bucket to be used as a static website
}


resource "aws_s3_bucket_policy" "my_s3bucket_policy" {
  bucket = aws_s3_bucket.my_s3bucket.bucket
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.my_s3bucket.bucket}/*"
        }
    ]
  }
EOF

}
/*
resource "aws_s3_object" "upload_object" {
    for_each = fileset("/home/theepan/aws_cloud_resume_challenge/frontend", "*")
    key = each.value
    bucket = aws_s3_bucket.my_s3bucket.bucket
    source = "/home/theepan/aws_cloud_resume_challenge/frontend/${each.value}"
    force_destroy = true
    content_type = lookup(local.content_types,regex()) # This need to be added to make sure the 
    # content is displayed correctly. Otherwise the content will be downloaded
  
}


resource "aws_s3_object" "upload_html" {

  bucket        = aws_s3_bucket.my_s3bucket.bucket
  key           = "index.html"
  source        = "/home/theepan/aws_cloud_resume_challenge/frontend/index.html"
  force_destroy = true
  content_type  = "text/html" # This need to be added to make sure the 
  # content is displayed correctly. Otherwise the content will be downloaded

}


resource "aws_s3_object" "upload_css" {

  bucket        = aws_s3_bucket.my_s3bucket.bucket
  key           = "index.css"
  source        = "/home/theepan/aws_cloud_resume_challenge/frontend/index.css"
  force_destroy = true
  content_type  = "text/css" # This need to be added to make sure the 
  # content is displayed correctly. Otherwise the content will be downloaded

}

*/

output "s3_bucket_id" {
  value = aws_s3_bucket.my_s3bucket.bucket_domain_name
}