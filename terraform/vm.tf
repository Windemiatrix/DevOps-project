resource "yandex_compute_instance" "master" {
  count = var.vm_MasterNode_count
  name  = "${var.vm_name}-master-${count.index + 1}"
  resources {
    cores  = var.vm_MasterNode_cores
    memory = var.vm_MasterNode_memory
  }
  boot_disk {
    initialize_params {
      size     = var.vm_MasterNode_disk
      image_id = var.vm_image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet_1.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    user-data          = <<-EOT
    #cloud-config
    users:
      - name: ${var.vm_user}
        groups: sudo
        shell: /bin/bash
        sudo: ['ALL=(ALL) NOPASSWD:ALL']
        ssh-authorized-keys:
          - ${file(var.vm_ssh_keyfile)}
    EOT
  }
  provisioner "remote-exec" {
    connection {
      host        = self.network_interface.0.nat_ip_address
      user        = var.vm_user
      private_key = file(var.vm_ssh_keyfile_private)
    }
    inline = ["echo '-= MASTER ${count.index} CONNECTED =-'"]
  }
}

resource "yandex_compute_instance" "worker" {
  count = var.vm_WorkerNode_count
  name  = "${var.vm_name}-worker-${count.index + 1}"
  resources {
    cores  = var.vm_WorkerNode_cores
    memory = var.vm_WorkerNode_memory
  }
  boot_disk {
    initialize_params {
      size     = var.vm_WorkerNode_disk
      image_id = var.vm_image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet_1.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    user-data          = <<-EOT
    #cloud-config
    users:
      - name: ${var.vm_user}
        groups: sudo
        shell: /bin/bash
        sudo: ['ALL=(ALL) NOPASSWD:ALL']
        ssh-authorized-keys:
          - ${file(var.vm_ssh_keyfile)}
    EOT
  }
  provisioner "remote-exec" {
    connection {
      host        = self.network_interface.0.nat_ip_address
      user        = var.vm_user
      private_key = file(var.vm_ssh_keyfile_private)
    }
    inline = ["echo '-= WORKER ${count.index} CONNECTED =-'"]
  }
}

resource "yandex_compute_instance" "ingress" {
  count = var.vm_Ingress_count
  name  = "${var.vm_name}-ingress-${count.index + 1}"
  resources {
    cores  = var.vm_Ingress_cores
    memory = var.vm_Ingress_memory
  }
  boot_disk {
    initialize_params {
      size     = var.vm_Ingress_disk
      image_id = var.vm_image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet_1.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    user-data          = <<-EOT
    #cloud-config
    users:
      - name: ${var.vm_user}
        groups: sudo
        shell: /bin/bash
        sudo: ['ALL=(ALL) NOPASSWD:ALL']
        ssh-authorized-keys:
          - ${file(var.vm_ssh_keyfile)}
    EOT
  }
  provisioner "remote-exec" {
    connection {
      host        = self.network_interface.0.nat_ip_address
      user        = var.vm_user
      private_key = file(var.vm_ssh_keyfile_private)
    }
    inline = ["echo '-= INGRESS ${count.index} CONNECTED =-'"]
  }
}

resource "yandex_vpc_network" "private_network" {
  name = "private_network"
}

resource "yandex_vpc_subnet" "private_subnet_1" {
  name           = "private_subnet_1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.private_network.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}
