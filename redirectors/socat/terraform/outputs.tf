output "aws_redirector_ip" {
  value = aws_instance.redirector.public_ip
}

output "to_ssh" {
  value = "ssh -i ./ssh_keys/${local_file.ssh_private_key_pem.filename} ubuntu@${aws_instance.redirector.public_ip}"
}
