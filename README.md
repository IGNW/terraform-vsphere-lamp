# terraform-vsphere-lamp
A Terraform module to create a LAMP server on vSphere

This code relies on there being an available vsphere template running Ubuntu 16.04.
The template must include an account with passwordless sudo privileges.
This template could be created by Packer - see https://github.com/IGNW/packer-vsphere-iso.git

Usage:

````
cp terraform.tfvars.example terraform.tfvars
````

Edit terraform.tfvars as appropriate for your environment.

````
export TF_VAR_vsphere_password=<password for the vsphere account indicated in the tfvars file>
export TF_VAR_ssh_password=<password for the account ssh_user account indicated in the tfvars file>
terraform init
terraform apply
````
