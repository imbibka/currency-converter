variable "image" {
  # BLANK 3 - one plain sentence: what is this value? (M6 checks every variable has one)
  description = "Docker image for my Currency Converter API"
  type        = string
  # BLANK 4 - your M3 image, tagged with a FULL commit SHA that is in your package.
  # Lowercase owner and repository. Never :latest.
  default = "ghcr.io/imbibka/currency-converter:f1de53e4c8a4abcf3b9aadea0de2cb06c86d6e91"
}

variable "internal_port" {
  description = "The port my service listens on inside the container - the contract's PORT"
  type        = number
  default     = 8080
}

variable "host_port" {
  description = "The port on my laptop: http://localhost:<host_port>/healthz"
  type        = number
  default     = 8080
}

variable "restart_policy" {
  description = "What Docker does when my service exits: no, on-failure, always or unless-stopped"
  type        = string
  default     = "no"
}
