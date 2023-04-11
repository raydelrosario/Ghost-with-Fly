terraform {
  required_providers {
    fly = {
      source  = "fly-apps/fly"
      version = "0.0.21"
    }
  }
}

provider "fly" {
}

variable "project_name" {
  type = string
}

resource "fly_app" "mysql" {
  name = "${var.project_name}-mysql"
}

resource "fly_volume" "mysql" {
  name   = "mysql_data"
  app    = fly_app.mysql.name
  size   = 1
  region = "iad"
}

resource "fly_app" "ghost" {
  name = "${var.project_name}-ghost"
}

resource "fly_volume" "ghost" {
  name   = "ghost_data"
  app    = fly_app.ghost.name
  size   = 1
  region = "iad"
}

resource "fly_app" "cloudflared" {
  name = "${var.project_name}-cloudflared"
}