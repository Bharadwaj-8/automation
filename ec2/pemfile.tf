resource "tls_private_key" "testing" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name   = "testing"
  public_key = tls_private_key.testing.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.testing.private_key_pem}" > testing.pem
    EOT
  }
}
