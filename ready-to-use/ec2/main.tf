provider "aws" {
  region  = "sa-east-1"
}


module "key_pair" {
  source = "../../modules/key_pair"
}

module "ec2" {
  source = "../../modules/ec2"

  key_name = module.key_pair.key_name
  volume_size = 15
  sg_ids = "sg-12345abcde"
  subnet_id = "subnet-123abcd"

}