provider "aws" {
  region  = "sa-east-1" #change to preferred region
  profile = "aws-profile-name" # localized at ~/.aws/config
}


module "key_pair" {
  source = "../../modules/key_pair"
}

module "ec2" {
  source = "../../modules/ec2"

  key_name      = module.key_pair.key_name
  volume_size   = var.volume_size
  sg_ids        = var.sg_ids
  subnet_id     = var.subnet_id
  instance_name = "my-terraform-ec2"
}