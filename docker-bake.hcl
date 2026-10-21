variable "PHP82_VERSION" {
  default = "php:8.2.35-fpm-alpine"
}

variable "PHP83_VERSION" {
  default = "php:8.3.36-fpm-alpine"
}

variable "PHP84_VERSION" {
  default = "php:8.4.27-fpm-alpine"
}

variable "PHP85_VERSION" {
  default = "php:8.5.12-fpm-alpine"
}

group "default" {
  targets = ["8_2", "8_3", "8_4", "8_5", "8_2_extra", "8_3_extra", "8_4_extra", "8_5_extra"]
}

target "8_2" {
  context = "."
  dockerfile = "images/base.dockerfile"
  args = {
    PHP_VERSION = "${PHP82_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["dustinscarberry/symfony:php8.2"]
}

target "8_3" {
  context = "."
  dockerfile = "images/base.dockerfile"
  args = {
    PHP_VERSION = "${PHP83_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["dustinscarberry/symfony:php8.3"]
}

target "8_4" {
  context = "."
  dockerfile = "images/base.dockerfile"
  args = {
    PHP_VERSION = "${PHP84_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["dustinscarberry/symfony:php8.4"]
}

target "8_5" {
  context = "."
  dockerfile = "images/base.dockerfile"
  args = {
    PHP_VERSION = "${PHP85_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["dustinscarberry/symfony:php8.5"]
}

target "8_2_extra" {
  context = "."
  dockerfile = "images/extra.dockerfile"
  args = {
    PHP_VERSION = "${PHP82_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["dustinscarberry/symfony:php8.2"]
}

target "8_3_extra" {
  context = "."
  dockerfile = "images/extra.dockerfile"
  args = {
    PHP_VERSION = "${PHP83_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["dustinscarberry/symfony:php8.3"]
}

target "8_4_extra" {
  context = "."
  dockerfile = "images/extra.dockerfile"
  args = {
    PHP_VERSION = "${PHP84_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["dustinscarberry/symfony:php8.4"]
}

target "8_5_extra" {
  context = "."
  dockerfile = "images/extra.dockerfile"
  args = {
    PHP_VERSION = "${PHP85_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["dustinscarberry/symfony:php8.5"]
}