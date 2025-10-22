output "Vault_url" {
  value = "http://${aws_instance.demo.public_ip}:8200"
}
