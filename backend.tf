terraform {
  backend "s3" {
    bucket = "demo-tfstate-files"
    region = "us-east-1"
    key = "env:/terraform.tfstate"
  }
}
