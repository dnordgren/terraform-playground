# Terraform Playground
A place for Derek to save IaC code as he goes through tutorials and learns Terraform and other configuration management tooling.

## Terraform Runbook
+ Follow <https://sync.hudlnet.com/x/QQC9D> to create a disposable account
    + Auth: `$ dce auth # see doc for username / password`
    + Create lease: `$ dce leases create -b 10 -c USD -e derek.nordgren@hudl.com -E 6h -p dce-user`
    + Login: `$ dce leases login --open-browser <LEASE_ID>`
    + Teardown: `$ dce leases end -a <ACCOUNT_ID> -p dce-user # Get the account ID by running dce leases list`
+ Create new IAM user and paste credentials in "terraform" entry of `~/.aws/credentials`
    + Add to new derek-example group with AdministratorAccess
+ Create new VPN and subnet (10.0.0.0/24 for both, derek-example)
    + From <https://github.com/hashicorp/terraform/issues/14488#issuecomment-360833910>; just needed `subnet_id` to launch the instance
    + These are noted in <https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started#troubleshooting> (ran into all of them before I saw this section)
