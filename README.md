[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-aws-api-stage-iam)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.15.0-blue.svg)

## Description

Create IAM Roles for execution of a specific service (bounded by a repository name) on a specific stage

## Usage

```hcl
module "iam" {
  source = "scaffoldly/serverless-api-stage-iam/aws"

  repository_name = var.repository_name
  stage           = var.stage
}
```

## Roadmap

- More customizable/restrictable permissions

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 1.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.54.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy_document.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The KMS Key Id for the stage (optional) | `string` | `""` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The repository name for the Serverless API (permissions are prefixed with this for service-level isololation of privileges) | `string` | n/a | yes |
| <a name="input_saml_trust"></a> [saml\_trust](#input\_saml\_trust) | Output of trust from saml-to/iam/aws module | <pre>map(<br>    object({<br>      trust_actions                 = list(string)<br>      trust_principal_identifiers   = list(string)<br>      trust_principal_type          = string<br>      trust_condition_saml_test     = string<br>      trust_condition_saml_variable = string<br>      trust_condition_saml_values   = list(string)<br>    })<br>  )</pre> | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | The stage (e.g. live, nonlive) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | n/a |
<!-- END_TF_DOCS -->
