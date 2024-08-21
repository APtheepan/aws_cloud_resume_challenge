terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "5.54.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.37.0"
    }

  }


  backend "s3" {
    bucket = "teeps-remote-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }


}

provider "aws" {

  region = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "vscode"
}


