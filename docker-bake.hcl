variable "build" {
  default = 0
}

variable "tag" {
  default = "latest"
}

variable "registry" {
  default = "localhost:5005"
}

variable "image" {
  default = "alluxio"
}

target "alluxio" {
  context    = "integration/docker/"
  dockerfile = "Dockerfile"
  tags       = ["${registry}/${image}:${tag}"]

  platforms  = ["linux/amd64", "linux/arm64"]

  output = ["type=registry"]

  args = {
    BUILD      = "${build}"
  }
}

group "all" {
  targets = ["alluxio"]
}
