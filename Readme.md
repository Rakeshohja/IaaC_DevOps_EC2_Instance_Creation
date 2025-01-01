````markdown
# Terraform EC2 Setup

This repository contains Terraform code for creating an EC2 instance on AWS with the necessary resources like Security Group, KeyPair, and IAM role.

## Prerequisites

Before using this code, ensure that you have the following:

- **Terraform** installed on your machine. (You can download it from [terraform.io](https://www.terraform.io/downloads.html))
- **AWS CLI** configured with access to your AWS account.
- **IAM user** with sufficient privileges to create EC2 instances, Security Groups, and Key Pairs.

## Files Overview

- **InstID.tf**: This file contains the IAM Role and EC2 instance configuration.
- **instance.tf**: Contains the EC2 instance setup (e.g., instance type, AMI, subnet).
- **SecGrp.tf**: Defines the security group to allow inbound/outbound traffic to the EC2 instance.
- **Keypair.tf**: Contains the KeyPair resource. (Note: The actual private key has been deleted. You can provide your own public key for the EC2 instance).
- **provider.tf**: Defines the AWS provider configuration, including region and access keys.

## How to Use

Follow these steps to set up and apply the Terraform configuration:

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone <repository_url>
cd <repository_name>
```
````

### 2. Provide Your Own SSH Key

Since the KeyPair private key has been deleted, you'll need to use your own public key.

1. Locate your SSH public key (usually in `~/.ssh/id_rsa.pub`).
2. Replace the value of the public key in `Keypair.tf` with your own key.

For example:

```hcl
resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArGDFhbDBg..."
}
```

### 3. Initialize Terraform

Navigate to the directory containing the Terraform files and run the following command to initialize Terraform:

```bash
terraform init
```

This will download the necessary providers and initialize the working directory.

### 4. Review the Plan

Run the following command to review the actions Terraform will take:

```bash
terraform plan
```

Terraform will show you a preview of the changes it will make to your AWS infrastructure.

### 5. Apply the Configuration

Once you're ready, apply the Terraform configuration to create the resources:

```bash
terraform apply
```

Terraform will prompt for confirmation. Type `yes` to proceed.

### 6. Access Your EC2 Instance

After the resources are created, Terraform will output the public IP address of the EC2 instance (if configured to do so). You can SSH into the instance using your SSH private key.

```bash
ssh -i /path/to/your/private-key.pem ec2-user@<public_ip>
```

### 7. Clean Up

To remove the created resources, run:

```bash
terraform destroy
```

This will tear down the infrastructure created by Terraform.

## Notes

- The EC2 instance will be created in the region specified in `provider.tf`. Ensure the region matches your requirements.
- Ensure you have the correct IAM policies set up for creating EC2 instances, security groups, and key pairs.
- If you want to customize instance settings (e.g., instance type, AMI), you can edit the `instance.tf` file.

## Contributing

Feel free to fork this repository, make improvements, and open pull requests. If you have any questions or suggestions, open an issue in the repository.

---

### **Security Considerations**

- **Public Key Management**: Never commit your private key to the repository. Ensure your private key is securely stored on your machine.

---
