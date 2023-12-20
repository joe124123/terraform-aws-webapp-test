variable "environment" {
  type    = string
  default = "dev"
}

variable "distribution_names" {
  type = list(string)
  default = []
}

# ... other variables as needed
