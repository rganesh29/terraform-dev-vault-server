variable "vpc-cidr" {
  description = "cidr value for the vpc"
  default = "10.0.0.0/16"
}

variable "vpc-tenancy" {
    description = "tenancy for the vpc (default/dedicated)"
    default = "default"
}

variable "vpc-name" {
  description = "name of the vpc"
  default = "demo-vpc"
}

variable "subnet-cidr" {
  description = "cidr value for the subnet"
  default = "10.0.1.0/24"
}

variable "subnet-az" {
  description = "az of the subnet"
  default = "us-east-1a"
}

variable "subnet-name" {
  description = "name of the subnet"
  default = "public-subnet"
}

variable "igw-name" {
  description = "name of the igw"
  default = "demo-igw"
}

variable "rt-name" {
    description = "name of the public route table"
    default = "public-rt"
}

variable "sg-name" {
  description = "name of the security group"
  default = "demo-sg"
}

variable "sg-description" {
    description = "description for the security group"
    default = "To allow port 22, 8200 for ssh and vault server."
}

variable "instance-key_name" {
  description = "name of the private key"
  default = "demo"
}

variable "instance-ami_id" {
  description = "instance ami-id"
  default = "ami-0360c520857e3138f"
}

variable "instance-type" {
  description = "type of the instance"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "prod" = "t2.medium"
  }
}
variable "instance-name" {
  description = "name of the instance"
  default = "demo-vault-server"
}