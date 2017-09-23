variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable machine_type {
  description = "Machine type"
  default     = "g1-small"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
