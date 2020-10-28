# Terraform Playground

A place for Derek to save IaC and CaC code as he goes through tutorials and learns Terraform and other infrastructure/configuration management tooling.

## Terraform Runbook {#tf}

+ Follow <https://sync.hudlnet.com/x/QQC9D> to create a disposable account
    + Auth: `$ dce auth # see doc for username / password`
    + Create lease: `$ dce leases create -b 10 -c USD -e derek.nordgren@hudl.com -E 6h -p dce-user`
    + Login: `$ dce leases login --open-browser <LEASE_ID>`
    + Teardown: `$ dce leases end -a <ACCOUNT_ID> -p dce-user # Get the account ID by running dce leases list`
+ Create new IAM user and paste credentials in "terraform" entry of `~/.aws/credentials`
    + Add to new derek-example group with AdministratorAccess
+ Create new VPC and subnet (10.0.0.0/24 for both, derek-example)
	+ Use console > VPC > Actions > Create default VPC
	+ From <https://github.com/hashicorp/terraform/issues/14488#issuecomment-360833910>; just needed `subnet_id` to launch the instance
    + These are noted in <https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started#troubleshooting> (ran into all of them before I saw this section)

## Packer Runbook {#packer}

*From the tutorial at <https://learn.hashicorp.com/tutorials/packer/getting-started-build-image>*:

+ Follow the same steps from [Terraform](#tf) to set up the DCE lease.
+ Follow the 'create default VPC' step as well.

[This note](https://learn.hashicorp.com/tutorials/packer/getting-started-build-image?in=packer/getting-started#known-issue) offers troubleshooting as this issue blocked me during a [separate HSC tutorial](https://learn.hashicorp.com/tutorials/terraform/packer?in=terraform/provision).

+ Run this command to build the [`example.json`](./images/example.json) image:

```
$ packer build \
    -var 'aws_access_key=YOUR ACCESS KEY' \
    -var 'aws_secret_key=YOUR SECRET KEY' \
    example.json
```