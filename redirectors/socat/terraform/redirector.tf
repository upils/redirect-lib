resource "aws_security_group" "allow_all" {
  name        = "allow_all_${var.redirector_name}"
  description = "Allow all traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "master" {
  key_name   = var.redirector_name
  public_key = tls_private_key.ssh.public_key_openssh
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "redirector" {
  tags = {
    Name = var.redirector_name
  }

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name                    = aws_key_pair.master.key_name
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_all.name]

  // To force waiting for the instance to be up. Cleanest way for now (https://github.com/hashicorp/terraform/issues/2811)
  provisioner "remote-exec" {
    inline = ["echo 'Instance ready!'"]

    connection {
      host        = aws_instance.redirector.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.ssh.private_key_pem
    }
  }

  provisioner "local-exec" {
    command = <<EOT
      ansible-playbook --user=ubuntu \
      --private-key=${local_file.ssh_private_key_pem.filename} \
      -e host=${aws_instance.redirector.public_ip} \
      -e c2_ip=${var.c2_ip} \
      -i '${aws_instance.redirector.public_ip},' \
      ${path.cwd}/../ansible/main.yml
      EOT
    // Warning: Do NOT remove the comma in the '-i' option. It is used to let ansible considered the value as a host, not a filename
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}
