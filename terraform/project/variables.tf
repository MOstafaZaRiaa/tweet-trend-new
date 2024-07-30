#-----------EC2 Variables--------------
variable "ami" {
    description= "to define the ami of ec2 instance"
    type= string 
}

variable "instance_type" {
    description= "to define the instance_type of ec2 instance"
    type= string 
}

#-----------S3 Variables--------------
variable "s3_bucket" {
    description= "The name of s3 bucket where we store state file"
    type= string 
}


#-----------DynamoDB Variables--------------
variable "dynamodb_name" {
    description= "The name of DynamoDB"
    type= string 
}

variable "dynamo_table_key" {
  description= "The name of DynamoDB table key"
  type = string
}

variable "dynamo_table_key_type" {
  type    = string
  default = "S"
}



variable "region" {
  type = string
  description = "The region where you put your VPC"
}