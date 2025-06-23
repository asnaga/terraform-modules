data "aws_vpc" "existing" {
  filter {
    name   = "tag:ENV"
    values = ["DEV"]
  }
  filter {
    name   = "tag:PROJ"
    values = ["MyProj"]
  }
}

data "aws_availability_zones" "available" {}

locals {
  vpc_cidr       = data.aws_vpc.existing.cidr_block
  public_subnets = [cidrsubnet(local.vpc_cidr, 4, 0), cidrsubnet(local.vpc_cidr, 4, 1)]
  private_subnets = [cidrsubnet(local.vpc_cidr, 4, 2), cidrsubnet(local.vpc_cidr, 4, 3)]
}
