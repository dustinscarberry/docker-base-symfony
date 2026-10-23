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

target "base" {
  context = "."
  dockerfile = "images/base.dockerfile"
  platforms = ["linux/amd64"]
}

target "extra" {
  context = "."
  dockerfile = "images/extra.dockerfile"
  platforms = ["linux/amd64"]
}

group "default" {
  targets = ["8_2", "8_3", "8_4", "8_5", "8_2_extra", "8_3_extra", "8_4_extra", "8_5_extra"]
}

target "8_2" {
  inherits = ["base"]
  args = {
    PHP_VERSION = "${PHP82_VERSION}"
  }
  tags = ["dustinscarberry/symfony:php8.2"]
}

target "8_3" {
  inherits = ["base"]
  args = {
    PHP_VERSION = "${PHP83_VERSION}"
  }
  tags = ["dustinscarberry/symfony:php8.3"]
}

target "8_4" {
  inherits = ["base"]
  args = {
    PHP_VERSION = "${PHP84_VERSION}"
  }
  tags = ["dustinscarberry/symfony:php8.4"]
}

target "8_5" {
  inherits = ["base"]
  args = {
    PHP_VERSION = "${PHP85_VERSION}"
  }
  tags = ["dustinscarberry/symfony:php8.5"]
}

target "8_2_extra" {
  inherits = ["extra"]
  args = {
    PHP_VERSION = "${PHP82_VERSION}"
  }
  tags = ["dustinscarberry/symfony:php8.2"]
}

target "8_3_extra" {
  inherits = ["extra"]
  args = {
    PHP_VERSION = "${PHP83_VERSION}"
  }
  tags = ["dustinscarberry/symfony:php8.3"]
}

target "8_4_extra" {
  inherits = ["extra"]
  args = {
    PHP_VERSION = "${PHP84_VERSION}"
  }
  tags = ["dustinscarberry/symfony:php8.4"]
}

target "8_5_extra" {
  inherits = ["extra"]
  args = {
    PHP_VERSION = "${PHP85_VERSION}"
  }
  tags = ["dustinscarberry/symfony:php8.5"]
}