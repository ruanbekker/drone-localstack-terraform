resource "random_password" "dummy_value" {
    length = 16
    special = false
    override_special = "_"
}

resource "aws_instance" "example" {
  ami           = "ami-00000000"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld-${random_password.dummy_value.result}"
  }
}
