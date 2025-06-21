provider "aws" {
  region = "eu-west-1" 
}

resource "aws_security_group" "curio_security_group" {
  name        = "curio-app-sg"
  description = "Security group for Curio application"

  # Custom TCP - Port 5000
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Consider restricting this for production
    description = "Custom TCP"
  }

  # HTTP - Port 80
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }

  # HTTPS - Port 443
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS"
  }

  # SSH - Port 22
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Consider restricting this to your IP for security
    description = "SSH"
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "curio-security-group"
  }
}

# Output the security group ID for reference
output "security_group_id" {
  value = aws_security_group.curio_security_group.id
}

resource "aws_instance" "this-instance" {
  ami                         = "ami-0db1de538d84beea0"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.curio_security_group.id
  ]
  user_data                   = <<-EOT
   
     #!/bin/bash

# Update system packages
sudo yum update -y

# Install Docker
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

aws configure set aws_access_key_id AKIA3QBW7CVS3HMBKTOW
aws configure set aws_secret_access_key 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
aws configure set default.region eu-west-1
aws configure set default.output json

# Pull and run container
docker pull a1watson/curio-app:latest
docker run -d -p 5000:5000
  
  EOT
  user_data_replace_on_change = true

  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    delete_on_termination = true
  }

  

  lifecycle {
    ignore_changes = [ami]
  }
}

resource "aws_s3_bucket" "this-bucket" {
  bucket        = "aws-curio-bucket-1"
  force_destroy = true
}

resource "aws_dynamodb_table" "this-table" {
  name           = "curio-table"
  hash_key       = "artifact-id"
  read_capacity  = 5              
  write_capacity = 5

  attribute {
    name = "artifact-id"
    type = "S"
  }
}