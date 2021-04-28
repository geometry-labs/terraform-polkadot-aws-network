variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "this" {}

variable "root_domain_name" {}

resource "random_pet" "this" {}

module "network" {
  source      = "../.."
  all_enabled = true
}
