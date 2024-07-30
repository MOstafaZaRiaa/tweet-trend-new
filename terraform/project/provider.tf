# Configure the provider software version
terraform {
  backend "s3" {
    bucket = "zariaa" #set your bucket name
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  access_key=""
  secret_key=""
  }