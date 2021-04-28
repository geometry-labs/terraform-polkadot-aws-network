# terraform-aws-polkadot-network

This module sets up VPCs, DNS zones, and security groups for running validator nodes on polkadot.

## Terraform versions

For Terraform v0.12.0+

## Usage

```hcl-terraform
module "this" {
  source = "github.com/insight-infrastructure/terraform-aws-polkadot-network"

  all_enabled          = true
  root_domain_name     = var.root_domain_name
  create_bastion       = true
  bucket_force_destroy = true
  bucket_name          = "logs-xxxx"
}
```

## Examples

- [simple](https://github.com/geometry-labs/terraform-aws-polkadot-network/tree/master/examples/simple)

## Known issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| api_node_sg | github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v3.2.0 |  |
| validator_sg | github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v3.2.0 |  |
| vpc | github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v2.15.0 |  |

## Resources

| Name |
|------|
| [aws_availability_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) |
| [aws_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| all\_enabled | Bool to enable all the security groups | `bool` | `false` | no |
| api\_enabled | Boolean to allow api related traffic | `bool` | `false` | no |
| api\_sg\_name | Name for the api security group | `string` | `"api-sg"` | no |
| azs | List of availability zones | `list(string)` | `[]` | no |
| bastion\_enabled | Boolean to enable a bastion host.  All ssh traffic restricted to bastion | `bool` | `false` | no |
| bastion\_sg\_name | Name for the bastion security group | `string` | `"bastion-sg"` | no |
| cidr | The cidr range for network | `string` | `"10.0.0.0/16"` | no |
| cloudflare\_enable | Make records in cloudflare | `bool` | `false` | no |
| consul\_enabled | Boolean to allow consul traffic | `bool` | `false` | no |
| consul\_sg\_name | Name for the consult security group | `string` | `"consul-sg"` | no |
| corporate\_ip | The corporate IP you want to restrict ssh traffic to | `string` | `""` | no |
| create\_internal\_domain | Boolean to create an internal split horizon DNS | `bool` | `false` | no |
| create\_public\_regional\_subdomain | Boolean to create regional subdomain - ie us-east-1.example.com | `bool` | `false` | no |
| health\_check\_port | Port number for the health check | `string` | `"5501"` | no |
| hids\_enabled | Boolean to enable intrusion detection systems traffic | `bool` | `false` | no |
| hids\_sg\_name | Name for the HIDS security group | `string` | `"hids-sg"` | no |
| id | A unique identifier for the deployment | `string` | `""` | no |
| internal\_tld | The top level domain for the internal DNS | `string` | `"internal"` | no |
| k8s\_enabled | Boolean to enable kubernetes | `bool` | `false` | no |
| k8s\_sg\_name | Name for the consult security group | `string` | `"k8s-sg"` | no |
| logging\_enabled | Boolean to allow logging related traffic | `bool` | `false` | no |
| logging\_sg\_name | Name for the logging security group | `string` | `"logging-sg"` | no |
| monitoring\_enabled | Boolean to for prometheus related traffic | `bool` | `false` | no |
| monitoring\_sg\_name | Name for the monitoring security group | `string` | `"monitoring-sg"` | no |
| name | The name of the deployment | `string` | `"polkadot-api"` | no |
| namespace | The namespace to deploy into | `string` | `"polkadot"` | no |
| network\_name | The network name, ie kusama / mainnet | `string` | `"kusama"` | no |
| network\_settings | Map of network settings to apply. Use either this or set individual variables. | <pre>map(object({<br>    name                = string<br>    shortname           = string<br>    api_health          = string<br>    polkadot_prometheus = string<br>    json_rpc            = string<br>    ws_rpc              = string<br>  }))</pre> | `null` | no |
| network\_stub | The stub name of the Polkadot chain (polkadot = polkadot, kusama = ksmcc3) | `string` | `"ksmcc3"` | no |
| num\_azs | The number of AZs to deploy into | `number` | `0` | no |
| polkadot\_network\_settings | Map of port settings for one or more polkadot networks | `map(map(string))` | <pre>{<br>  "polkadot": {<br>    "api_health": "5500",<br>    "json_rpc": "9933",<br>    "name": "polkadot",<br>    "polkadot_prometheus": "9610",<br>    "shortname": "polkadot",<br>    "ws_rpc": "9944"<br>  }<br>}</pre> | no |
| polkadot\_prometheus\_port | Port number for the Prometheus Metrics exporter built into the Polkadot client | `string` | `"9610"` | no |
| root\_domain\_name | The public domain | `string` | `""` | no |
| rpc\_api\_port | Port number for the JSON RPC API | `string` | `"9934"` | no |
| ssh\_enabled | Boolean to enable a ssh access.  All ssh traffic restricted to ssh\_cidr\_blocks | `bool` | `false` | no |
| ssh\_inbound\_cidr\_blocks | The corporate IP you want to restrict ssh traffic to | `string` | `"0.0.0.0/0"` | no |
| subdomain | The subdomain | `string` | `""` | no |
| tags | The tags of the deployment | `map(string)` | `{}` | no |
| validator\_enabled | Boolean to allow validator related traffic | `bool` | `false` | no |
| validator\_sg\_name | Name for the validator security group | `string` | `"validator-sg"` | no |
| vpc\_name | The name of the VPC | `string` | `""` | no |
| wss\_api\_port | Port number for the Websockets API | `string` | `"9945"` | no |
| zone\_id | The zone ID to configure as the root zoon - ie subdomain.example.com's zone ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| api\_security\_group\_id | n/a |
| azs | n/a |
| private\_subnets | n/a |
| private\_subnets\_cidr\_blocks | n/a |
| public\_subnet\_cidr\_blocks | n/a |
| public\_subnets | n/a |
| validator\_security\_group\_id | n/a |
| vpc\_id | #### VPC #### |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Geometry Labs](https://github.com/geometry-labs)

## License

Apache 2 Licensed. See LICENSE for full details.