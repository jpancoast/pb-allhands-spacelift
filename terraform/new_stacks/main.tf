provider "spacelift" {}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

resource "spacelift_stack" "stupid_stack" {
  name                            = "stupid_stack_4"
  administrative                  = false
  autodeploy                      = true
  branch                          = "main"
  repository                      = "pb-allhands-spacelift"
  project_root                    = "terraform/aws/vpc"
  manage_state                    = true
  terraform_external_state_access = true
  terraform_smart_sanitization    = true
  terraform_version               = "1.6.2"
  space_id                        = "pb-allhands-01HVQ1K7ETJAWFR26QXC2B4S41"
  terraform_workflow_tool         = "OPEN_TOFU"
}

resource "spacelift_aws_integration" "this" {
  name = "aws_integration_pb_allhands"

  # We need to set the ARN manually rather than referencing the role to avoid a circular dependency
  role_arn                       = "arn:aws:iam::339477103113:role/spacelift-allhands-testing"
  generate_credentials_in_worker = false
  space_id                       = "pb-allhands-01HVQ1K7ETJAWFR26QXC2B4S41"
}

resource "spacelift_aws_integration_attachment" "this" {
  integration_id = spacelift_aws_integration.this.id
  stack_id       = spacelift_stack.stupid_stack.id
  read           = true
  write          = true
}

output "stupid_stack" {
  value     = spacelift_stack.stupid_stack
  sensitive = true
}

output "thing" {
  value = "thing"
}
