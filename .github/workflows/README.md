# Terraform Workflow

This workflow sets up a Terraform environment and applies Terraform configurations to create infrastructure resources. It also extracts the public IP address of the newly created instance and prints it.

## Workflow Details

- **Name**: Terraform
- **Trigger**: This workflow is triggered on push events to the `master` or `main` branch.

## Environment Variables

- `AWS_ACCESS_KEY_ID`: AWS access key ID (stored in GitHub secrets).
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key (stored in GitHub secrets).
- `AWS_DEFAULT_REGION`: The AWS region to deploy the resources (set to `eu-west-1`).

## Workflow Steps

1. **Checkout**
   - Action: `actions/checkout@v3.5.3`
   - Description: Checks out the source code repository.

2. **Setup Terraform**
   - Action: `hashicorp/setup-terraform@v2.0.3`
   - Description: Sets up the Terraform environment.

3. **Terraform Init**
   - Command: `terraform init`
   - Description: Initializes the Terraform working directory.

4. **Terraform Validate**
   - Command: `terraform validate`
   - Description: Validates the Terraform configuration files.

5. **Terraform Apply**
   - Command: `terraform apply -auto-approve | tee output.log`
   - Description: Applies the Terraform configurations to create infrastructure resources. The output is saved to `output.log`.

6. **Get IP from new instance**
   - Command: Extracts the public IP address of the newly created instance from `output.log` and formats it as `http://<ip_address>`. The formatted IP address is stored in the `formatted_ip` environment variable.
   -   The reason for extracting the IP address from the log instead of performing an instance description is to avoid the AWS credential setup, and because Terraform was giving me problems with it, however, an issue will be open to address this in a more professional way.

7. **Print Public IP**
   - Command: Retrieves the formatted IP address from the `formatted_ip` environment variable and prints it. Stores the IP address in the `ip_address` environment variable.
