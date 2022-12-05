variable "repository_name" {
  type        = string
  description = "The repository name for the Serverless API (permissions are prefixed with this for service-level isololation of privileges)"
}
variable "stage" {
  type        = string
  description = "The stage (e.g. live, nonlive)"
}
variable "kms_key_id" {
  type        = string
  description = "The KMS Key Id for the stage (optional)"
  default     = ""
}
variable "saml_trust" {
  type = object({
    trust_actions                 = list(string)
    trust_principal_identifiers   = list(string)
    trust_principal_type          = string
    trust_condition_saml_test     = string
    trust_condition_saml_variable = string
    trust_condition_saml_values   = list(string)
    }
  )
  description = "Output of trust from saml-to/iam/aws module"
  default     = null
}
