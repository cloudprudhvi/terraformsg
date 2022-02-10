module "securitygroup" {
  #source = "/c/Users/prudh/Desktop/uptime/cluster"
  source = "./../cluster"
  env = "staging"
}
terraform {
  required_providers {
    aws = {
      version = ">= 3.7.0"
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = "us-west-2"
  profile = "default"
}