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
