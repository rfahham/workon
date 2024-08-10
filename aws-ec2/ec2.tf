resource "aws_instance" "web" {
  count         = var.number_instances
  ami           = var.aws_ami
  instance_type = var.instance_type
  tags = {
    Name    = "aws-instance-${count.index}"
    Project = "Criando instancias com countID e profile"
  }
}