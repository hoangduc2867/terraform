## Run Terraforms
```bash
$ terraform init
$ terraform plan
$ terraform apply
```
## Terminate prod-private-wallet-build
```bash
$ cp prod-private-wallet-build/terraform.tfstate .
$ terraform destroy
```
> [!WARNING]  
> Ansible only supports AWS Linux OS. If you use another OS, you should switch to another branch or not use Ansible feature.
# Build up
## Install Terraform
> Another OS: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
## Generate key
> Generate ssh key
```bash
$ ssh-keygen -t ed25519 -C "example@mail.com"
```
## Add SSH Agent
```bash
$ ssh-add ./key_pair/{keypair}
$ ssh -J ec2-user@{bastion_ip} ec2-user@{private_ip} -i ./key_pair/{keypair}
```
