## Digitalocean Terraform

Simple Terraform environment used to quickly up droplets on [Digital Ocean](https://m.do.co/c/8c0cdf1b15c0).

### Requirements

* [Digital Ocean API Token](https://cloud.digitalocean.com/settings/api/tokens/new)
* [Terraform](https://www.terraform.io/) v0.10.x or later

### Setup

1. Clone this repository to a local directory of your choice

5. Copy `terraform.tfvars.sample` to `terraform.tfvars`

6. Put your API key and SSH key fingerprint in `terraform.tfvars`

7. Run `terraform init` from the repository root

### Usage

Each of the commands below should be run locally from the repository root:

```bash
$ terraform plan

No changes. Infrastructure is up-to-date.

This means that Terraform did not detect any differences between your
configuration and real physical resources that exist. As a result, no
actions need to be performed.
```

```bash
$ terraform apply

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

droplets_ipv4 = {}
```

### Configuration

* `droplet_size` defaults to `512mb` in provided *.tfvars file.
* `droplet_image` defaults to `ubuntu-16-04-x64` in provided *.tfvars file.
* `droplet_region` defaults to `sfo2` in provided *.tfvars file.

## License

Template is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
