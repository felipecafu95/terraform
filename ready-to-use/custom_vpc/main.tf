provider "aws" {
  default_tags {
    tags = {
      Environment = "dev"
      Project     = "Lab"
      Manager     = "Terraform"
    }
  }
  region  = "us-east-1"      #change to preferred region
  profile = "vrtomorrowland" # localized at ~/.aws/config
}

module "vpc" {
  source = "../../modules/vpc"

  region             = "us-east-1"
  azs                = { us-east-1 = "us-east-1a,us-east-1c,us-east-1e" }
  create_vpc         = true
  single_nat_gateway = true
  eks_subnet         = true
  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "Terraform"
}


output "vpc_id" {
  value = module.vpc.vpc_id
}
output "subnet_pub" {
  value = module.vpc.subnet_pub
}
output "subnet_pvt" {
  value = module.vpc.subnet_pvt
}
output "subnet_db" {
  value = module.vpc.subnet_db
}
output "subnet_eks_private" {
  value = module.vpc.subnet_eks_private
}
output "subnet_eks_public" {
  value = module.vpc.subnet_eks_public
}