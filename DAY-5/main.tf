resource "aws_instance" "dev" {
    ami = "ami-0521cb2d60cfbb1a6"
    instance_type = "t3.micro"
    key_name = "AWS_KeyPair"
    tags = {
        Name = "dev"
    }

}