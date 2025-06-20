provider "aws" {
  region = "eu-west-1" 
}

resource "aws_instance" "this-instance" {
  ami                         = "ami-0d5688bba1210af52"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
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

# Authenticate with ECR
aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 790389265765.dkr.ecr.eu-west-1.amazonaws.com

# Pull and run container
docker pull 790389265765.dkr.ecr.eu-west-1.amazonaws.com/curio:latest
docker run -d -p 5000:5000 \
  -e AWS_REGION=eu-west-1 \
  -e AWS_TABLE_NAME=curio-table \
  -e AWS_BUCKET_NAME=curio-bucket \
  -e AWS_ACCESS_KEY_ID=AKIA3QBW7CVST73MGYMY \
  -e AWS_SECRET_ACCESS_KEY=Tu6cyjbhECCMJaVRkMlC+mEWYAlfiFGdzGcxMsZh \
  --name curio-app \
  790389265765.dkr.ecr.eu-west-1.amazonaws.com/curio:latest
  
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

resource "aws_ecr_repository" "this-repo" {
  name                 = "curio"
  image_tag_mutability = "MUTABLE"
  encryption_configuration {
    encryption_type = "AES256"
  }

  lifecycle {
    prevent_destroy = false
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