module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc            = var.vpc
  igw            = var.igw
  subnet_public  = var.subnet_public
  az             = var.az
  psb            = var.psb
  subnet_private = var.subnet_private
  privtsb        = var.privtsb
  proute         = var.proute
}