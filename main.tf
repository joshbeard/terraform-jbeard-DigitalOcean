#
# Common DigitalOcean resources
#

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
# or using TV_VAR_do_token env var...
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  #token = "${var.do_token}"
  token = var.do_token
}