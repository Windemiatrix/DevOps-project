terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.58.0"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.1.0"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.1.0"
    }
    template = {
      source = "hashicorp/template"
      version = "~> 2.2.0"
    }
  }
}

provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.yandex_zone
}
