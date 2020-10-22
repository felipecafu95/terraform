## Usage

To create an new EC2 instance at AWS; you need to configure your credentials in `main.tf` using the options bellow:


```
provider "aws" {
  region     = "sa-east-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

or using `profile` option (if you alread configured your keys using `aws configure` command)

```
provider "aws" {
  region     = "sa-east-1"
  profile    = "your-profile-name" 
}
```

Another option to use AWS as your provider, is using a `IAM ROLE`

https://registry.terraform.io/providers/hashicorp/aws/latest/docs


## Variables

After your configured your credentials; change the `default` values in `variables.tf` file

```
module "ec2" {
  source = "../../modules/ec2"

  key_name      = module.key_pair.key_name
  volume_size   = var.volume_size
  sg_ids        = var.sg_ids
  subnet_id     = var.subnet_id

}
```
Both `subnet_id`,`sg_ids` and `volume_size` to your wanted (and existing) values;