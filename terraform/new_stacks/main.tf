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
  project_root                    = "stupid_stack"
  manage_state                    = true
  terraform_external_state_access = true
  space_id                        = "pb-allhands-01HVQ1K7ETJAWFR26QXC2B4S41"
}

output "stupid_stack" {
  value     = spacelift_stack.stupid_stack
  sensitive = true
}

output "blah" {
  value = "blah"
}
