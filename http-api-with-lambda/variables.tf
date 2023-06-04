variable "api-name" {
  default = "first-http-api"
}

variable "api-name-dummy" {
  default = "dummy"
}

variable "dummy_stages" {
  type = map(object({
    name         = string
    auto_deploy  = bool
  }))
  default = {
    dev = {
      name        = "dev"
      auto_deploy = true
    }
  }
}

variable "functionName" {
  default = "LeapYearFunction"
}