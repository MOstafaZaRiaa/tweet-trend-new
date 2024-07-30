
# Configue the ec2 resource
module "ec2-module"{
    source="../modules/ec2"
    ami= var.ami
    instance_type= var.instance_type
    subnet_id = module.network.public_subnet_id
    instance_name = ["jenkins-master", "jenikns-slave", "ansible"]
    security_group_id = module.network.security_group_id
}
module "network" {
  source = "../modules/vpc"
  az = "us-east-1a"
}



#in case you want to create s3 bucket uncommand below lines
#module "create_s3_bucket" {
  #source = "../modules/s3-bucket"
  #bucket_name = var.s3_bucket
#}
