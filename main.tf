resource "aws_s3_bucket" "myweb" {
   bucket = "mywebsite-static12345"
  
}

resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.myweb.bucket
    source = "./index.html"
    key = "index.html"
    content_type = "text/html"
  }

resource "aws_s3_object" "styles" {
    bucket = aws_s3_bucket.myweb.bucket
    source = "./styles.css"
    key = "styles.css"
    content_type = "text/css"
  }

resource "aws_s3_bucket_public_access_block" "mywebsite" {
  bucket = aws_s3_bucket.myweb.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "myweb" {
  bucket = aws_s3_bucket.myweb.id
  policy = jsonencode (
   {
     Version = "2012-10-17",
    Statement= [
        {
            Sid = "PublicReadGetObject",
            Effect = "Allow",
            Principal = "*",
            Action = "s3:GetObject"
            Resource = "arn:aws:s3:::${aws_s3_bucket.myweb.id}/*"
        }
    ]
   }
    )
}


resource "aws_s3_bucket_website_configuration" "myweb" {
  bucket = aws_s3_bucket.myweb.id

  index_document {
    suffix = "index.html"
  }

}