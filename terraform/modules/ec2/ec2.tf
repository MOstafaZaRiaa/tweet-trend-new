# Configue the ec2 resource
resource "aws_instance" "my-ec2"{
    ami= var.ami
    instance_type= var.instance_type
     key_name = "vockey"
    vpc_security_group_ids = [var.security_group_id]
    subnet_id = var.subnet_id
   
    for_each = toset(var.instance_name)
    tags = {
      Name = "${each.key}"
    }
}
