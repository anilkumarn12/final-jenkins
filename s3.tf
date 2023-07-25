terraform {
  backend "s3" {
    bucket = "my-s3-bucket-25"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}

