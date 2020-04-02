output "redirector_ip" {
  value = aws_instance.redirector.public_ip
}

output "to_connect_with_ssh" {
  value = "ssh -i ${local_file.ssh_private_key_pem.filename} ubuntu@${aws_instance.redirector.public_ip}"
}

output "to_redirect" {
  value = "You still have to connect with SSH on the instance with arguments specified in the READMD.md to create the redirection."
}
