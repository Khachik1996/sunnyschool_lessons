resource "aws_s3_bucket" "testdomain_net" {
  bucket = "testdomain.net"
  acl    = "public-read"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VPCE",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": [
        "arn:aws:s3:::testdomain.net/*"
      ],
      "Condition": {
        "StringEquals": {
          "aws:SourceVpce": "${aws_vpc_endpoint.my_endpoint.id}"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_object" "index_html" {
  bucket = aws_s3_bucket.testdomain_net.id
  key    = "index.html"
  content_type = "text/html"
  content = <<-EOF
<!doctype html>
<html>
  <head>
    <title>Demo</title>
  </head>
  <body>
    <p>This is a test page for your internal website hosted with AWS ALB and S3!</p>
  </body>
</html>
EOF
}

