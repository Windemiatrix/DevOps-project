output "Private_IPs" {
  description = "The public IP address of each virtual machine deployed, indexed by name."

  value = (zipmap(
    flatten([
      tolist(yandex_compute_instance.master.*.name),
      tolist(yandex_compute_instance.worker.*.name),
      tolist(yandex_compute_instance.ingress.*.name),
    ]),
    flatten([
      tolist(yandex_compute_instance.master.*.network_interface.0.ip_address),
      tolist(yandex_compute_instance.worker.*.network_interface.0.ip_address),
      tolist(yandex_compute_instance.ingress.*.network_interface.0.ip_address),
    ]),
  ))
}

output "Public_IPs" {
  description = "The public IP address of each virtual machine deployed, indexed by name."

  value = (zipmap(
    flatten([
      tolist(yandex_compute_instance.master.*.name),
      tolist(yandex_compute_instance.worker.*.name),
      tolist(yandex_compute_instance.ingress.*.name),
    ]),
    flatten([
      tolist(yandex_compute_instance.master.*.network_interface.0.nat_ip_address),
      tolist(yandex_compute_instance.worker.*.network_interface.0.nat_ip_address),
      tolist(yandex_compute_instance.ingress.*.network_interface.0.nat_ip_address),
    ]),
  ))
}
