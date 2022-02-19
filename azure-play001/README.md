# Terraform - Azure Play 001
----------
## Introduction
This is my first venture into Terraform, things may change quickly or be amended/destroyed.

I will do my best to commit as regularly as possible, and not squash-merge or remove the branch to reference back if required

I will also do my best to comment what each TF file does.

----------

## What this Play does
1. Creates a resource group
2. Deploys a Virtual Network, with a single Subnet
3. Deploys a Neetwork Security Group
4. Creates a NSG-Subnet association with the created resources
5. Creates a NIC for a Virtual Machine
6. Builds a new KeyVault
7. Generates Administrator Password credential to KeyVault
8. Creates a Windows Server 2019 SmallDisk Virtual Machine, assigned to the NIC previously created
9. Sets the local administrator password to the one stored in Azure KeyVault.
10. Creates and attaches a data disk to the virtual machine