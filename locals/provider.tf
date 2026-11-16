terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }
  }
  backend "s3" {
    bucket = "remote-state-25s"
    key = "locals-demo"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true    
  }
}

provider "aws" {
  region = "us-east-1"
  # Configuration options

}