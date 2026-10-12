variable "session_policies_lookup" {
  description = <<EOT
Map of session_policies_lookup, attributes below
Optional:
    - like
    - starts_with
    - with_describe
    - in (block):
        - account (optional)
        - application (optional)
        - application_package (optional)
        - database (optional)
        - schema (optional)
    - limit (block):
        - from (optional)
        - rows (required)
    - on (block):
        - account (optional)
        - user (optional)
EOT

  type = map(object({
    like          = optional(string)
    starts_with   = optional(string)
    with_describe = optional(bool)
    in = optional(object({
      account             = optional(bool)
      application         = optional(string)
      application_package = optional(string)
      database            = optional(string)
      schema              = optional(string)
    }))
    limit = optional(object({
      from = optional(string)
      rows = number
    }))
    on = optional(object({
      account = optional(bool)
      user    = optional(string)
    }))
  }))
}

