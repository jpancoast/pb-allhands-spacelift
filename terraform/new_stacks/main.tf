provider "spacelift" {}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

resource "spacelift_stack" "stupid_stack" {
  name                            = "stupid_stack"
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

output "stupid_stack" {
  value     = spacelift_stack.stupid_stack
  sensitive = true
}

output "thing" {
  value = "thing"
}
