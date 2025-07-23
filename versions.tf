terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.95" # do not upgrade to the lastest version & version conflicts can outbreak if used modules do not yet support lastest aws version
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
  }
}

provider "aws" {
  profile = "terraform-cloud-user"
  region  = "ap-southeast-1"
}