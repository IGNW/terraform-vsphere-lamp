output "hostname" {
  value = "${var.hostname}"
}

output "public_ip" {
  value = "${module.lamp.public_ip}"
}
