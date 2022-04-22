locals {
  tipo_instancia = "t2.${var.tipo_instancia}"
}

resource "aws_instance" "api_server1" {
  ami           = data.aws_ami.windows.id
  instance_type = local.tipo_instancia
  cpu_core_count = max(1, var.quantidade_cpus)

  tags = {
    Name = var.etiquetas["Name"]
  }
}

data "aws_ami" "windows" {
  most_recent = true
  owners = [ "amazon", "aws-marketplace", "self" ]

  filter {
    name = "platform"
    values = [ var.plataformas[0] ]
  }
}