resource "null_resource" "deploy_docker" {
  provisioner "local-exec" {
    command = "ansible-playbook ../ansible/docker/install.yml"
  }
  depends_on = [
    yandex_compute_instance.master,
    yandex_compute_instance.worker,
    yandex_compute_instance.ingress,
    local_file.docker,
    local_file.AnsibleInventory
  ]
}

resource "null_resource" "deploy_kubernetes" {
  provisioner "local-exec" {
    command = "ansible-playbook -b ../ansible/kubespray/cluster.yml"
  }
  depends_on = [
    null_resource.deploy_docker,
    local_file.docker,
    local_file.AnsibleInventory
  ]
}

