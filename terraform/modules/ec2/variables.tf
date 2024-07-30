
variable "ami" {
    description= "to define the ami of ec2 instance"
    type= string 
}

variable "instance_type" {
    description= "to define the instance_type of ec2 instance"
    type= string 
}

variable "security_group_id" {
    description= "to get vpc id to use it "
    type= string 
}

variable "subnet_id" {
    description= "to define the subnet of ec2 instance"
    type= string 
}
variable "instance_name" {
    description= "to define the name of ec2 instance"
    type= list(string) 
}


