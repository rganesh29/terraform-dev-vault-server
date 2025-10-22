resource "aws_instance" "demo" {
  ami = var.instance-ami_id
  instance_type = var.instance-type
  key_name = var.instance-key_name
  subnet_id = aws_subnet.demo.id
  vpc_security_group_ids = [aws_security_group.demo.id]

  tags = {
    Name = var.instance-name
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("/Users/ganeshr/Downloads/demo.pem")
    host = self.public_ip
  }

  provisioner "file" {
    source = "./vault-install.sh"
    destination = "/home/ubuntu/vault-install.sh" 
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 470 vault-install.sh",
      "sudo sh vault-install.sh",
      "sudo chmod 470 vault.log"]
  }

  depends_on = [ aws_vpc.demo, aws_subnet.demo ]
}

