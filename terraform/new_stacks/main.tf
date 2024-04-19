provider "spacelift" {}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

resource "spacelift_stack" "stupid_stack" {
  gitlab {
    namespace = "jpancoast"
    id        = "jpancoast-gitlab-personal"
  }

  name                            = "stupid_stack"
  administrative                  = true
  autodeploy                      = true
  branch                          = "main"
  repository                      = "spacelift-all-hands"
  project_root                    = "stupid_stack"
  manage_state                    = true
  terraform_external_state_access = true
}

output "stupid_stack" {
  value     = spacelift_stack.stupid_stack
  sensitive = true
}

output "blah" {
  value = "blah"
}
