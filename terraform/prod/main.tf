provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source          = "../modules/app"
  machine_type    = "${var.machine_type}"
  zone            = "${var.zone}"
  public_key_path = "${var.public_key_path}"
  disk_image      = "${var.app_disk_image}"
}

module "db" {
  source          = "../modules/db"
  machine_type    = "${var.machine_type}"
  zone            = "${var.zone}"
  public_key_path = "${var.public_key_path}"
  disk_image      = "${var.db_disk_image}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = "${var.vpc_source_ranges}"
}

terraform {
  backend "gcs" {
    bucket  = "ns-devops"
    path    = "terraform/prod/terraform.tfstate"
  }
}
