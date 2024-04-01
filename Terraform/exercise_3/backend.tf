terraform {
  backend "s3" {
    bucket = "terafform-s3-state36"
    key    = "tfstate/state"
    region = "us-east-2"
  }
}

