#!/bin/bash

# Prompt for AWS credentials
read -p "Enter your AWS Access Key ID: " AWS_ACCESS_KEY_ID
read -s -p "Enter your AWS Secret Access Key: " AWS_SECRET_ACCESS_KEY
echo
read -p "Enter your AWS Region (default: us-east-1): " AWS_DEFAULT_REGION
AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-us-east-1}

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION

echo "Initializing Terraform…"
terraform init

 Check if terraform init was successful
if [ $? -eq 0 ]; then
    echo "Terraform initialization successful."
else
    echo "Terraform initialization failed."
    exit 1
fi

 Create a Terraform plan
echo "Creating Terraform plan…"
terraform plan -out=tfplan

 Check if terraform plan was successful
if [ $? -eq 0 ]; then
    echo "Terraform plan created successfully."
else
    echo "Failed to create Terraform plan."
    exit 1
fi

 Ask user if they want to apply the plan
echo "Do you want to apply this plan? (yes/no)"
read answer
if [ "$answer" == "yes" ]; then
    # Apply the Terraform plan
    echo "Applying Terraform plan…"
    terraform apply "tfplan"

    # Check if terraform apply was successful
    if [ $? -eq 0 ]; then
        echo "Terraform apply successful."
    else
        echo "Terraform apply failed."
        exit 1
    fi
else
    echo "Apply cancelled."
fi