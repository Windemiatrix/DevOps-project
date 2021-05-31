resource "local_file" "AnsibleInventory" {
  content  = <<EOT
[all]
%{for node in yandex_compute_instance.master.*~}
${node.name} ansible_host=${node.network_interface.0.nat_ip_address} ip=${node.network_interface.0.ip_address} access_ip=${node.network_interface.0.nat_ip_address} ansible_user=${var.vm_user} ansible_ssh_common_args='-o StrictHostKeyChecking=no' ansible_python_interpreter='python3'
%{endfor~}
%{for node in yandex_compute_instance.worker.*~}
${node.name} ansible_host=${node.network_interface.0.nat_ip_address} ip=${node.network_interface.0.ip_address} access_ip=${node.network_interface.0.nat_ip_address} ansible_user=${var.vm_user} ansible_ssh_common_args='-o StrictHostKeyChecking=no' ansible_python_interpreter='python3'
%{endfor~}
%{for node in yandex_compute_instance.ingress.*~}
${node.name} ansible_host=${node.network_interface.0.nat_ip_address} ip=${node.network_interface.0.ip_address} access_ip=${node.network_interface.0.nat_ip_address} ansible_user=${var.vm_user} ansible_ssh_common_args='-o StrictHostKeyChecking=no' ansible_python_interpreter='python3'
%{endfor~}

[kube_control_plane]
%{for node in yandex_compute_instance.master.*~}
${node.name}
%{endfor~}

[etcd]
%{for node in yandex_compute_instance.master.*~}
${node.name}
%{endfor~}

[kube-node]
%{for node in yandex_compute_instance.worker.*~}
${node.name}
%{endfor~}

[kube-ingress]
%{for node in yandex_compute_instance.ingress.*~}
${node.name}
%{endfor~}

[calico-rr]

[k8s-cluster:children]
kube_control_plane
kube-node
calico-rr
EOT
  filename = "../ansible/environments/inventory"
  depends_on = [
    yandex_compute_instance.master,
    yandex_compute_instance.worker,
    yandex_compute_instance.ingress,
  ]
}
