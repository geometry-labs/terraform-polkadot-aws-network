# terraform-aws-polkadot-network

This module sets up VPCs and security groups for running validator and API nodes on polkadot.

## Terraform versions

For Terraform v0.12.0+

## Usage

```hcl-terraform
module "this" {
  source = "github.com/geometry-labs/terraform-aws-polkadot-network"
  all_enabled          = true
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
| cidr | The cidr range for network | `string` | `"10.0.0.0/16"` | no |
| health\_check\_port | Port number for the health check | `string` | `"5501"` | no |
| id | A unique identifier for the deployment | `string` | `""` | no |
| name | The name of the deployment | `string` | `"polkadot-api"` | no |
| network\_name | The network name, ie kusama / mainnet | `string` | `"kusama"` | no |
| network\_settings | Map of network settings to apply. Use either this or set individual variables. | <pre>map(object({<br>    name                = string<br>    shortname           = string<br>    api_health          = string<br>    polkadot_prometheus = string<br>    json_rpc            = string<br>    ws_rpc              = string<br>  }))</pre> | `null` | no |
| network\_stub | The stub name of the Polkadot chain (polkadot = polkadot, kusama = ksmcc3) | `string` | `"ksmcc3"` | no |
| num\_azs | The number of AZs to deploy into | `number` | `0` | no |
| polkadot\_prometheus\_port | Port number for the Prometheus Metrics exporter built into the Polkadot client | `string` | `"9610"` | no |
| rpc\_api\_port | Port number for the JSON RPC API | `string` | `"9934"` | no |
| ssh\_enabled | Boolean to enable a ssh access.  All ssh traffic restricted to ssh\_cidr\_blocks | `bool` | `false` | no |
| ssh\_inbound\_cidr\_blocks | The corporate IP you want to restrict ssh traffic to | `string` | `"0.0.0.0/0"` | no |
| tags | The tags of the deployment | `map(string)` | `{}` | no |
| validator\_enabled | Boolean to allow validator related traffic | `bool` | `false` | no |
| validator\_sg\_name | Name for the validator security group | `string` | `"validator-sg"` | no |
| vpc\_name | The name of the VPC | `string` | `""` | no |
| wss\_api\_port | Port number for the Websockets API | `string` | `"9945"` | no |

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