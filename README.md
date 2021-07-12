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

## Providers

## Modules

## Resources

## Inputs

## Outputs

<!-- END_TF_DOCS -->
