variable "yandex_token" {
  default     = ""
  description = "Yandex token"
}

variable "yandex_cloud_id" {
  default     = ""
  description = "Yandex cloud id"
}

variable "yandex_folder_id" {
  default     = ""
  description = "Yandex folder id"
}

variable "yandex_zone" {
  default     = ""
  description = "Yandex zone"
}

variable "vm_name" {
  default     = ""
  description = "Virtual machine name"
}

variable "vm_user" {
  default     = "ubuntu"
  description = "User account for all VM"
}

variable "vm_ssh_keyfile" {
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to ssh key for user account for all VM"
}

variable "vm_ssh_keyfile_private" {
  default     = "~/.ssh/id_rsa"
  description = "Path to ssh key for user account for all VM"
}

variable "vm_image_id" {
  default     = ""
  description = "Virtual machine template name"
}

variable "vm_MasterNode_count" {
  default     = 3
  description = "Domain name"
}

variable "vm_MasterNode_cores" {
  default     = 2
  description = "Domain name"
}

variable "vm_MasterNode_memory" {
  default     = 4
  description = "Domain name"
}

variable "vm_MasterNode_disk" {
  default     = 10
  description = "Domain name"
}

variable "vm_WorkerNode_count" {
  default     = 2
  description = "Domain name"
}

variable "vm_WorkerNode_cores" {
  default     = 2
  description = "Domain name"
}

variable "vm_WorkerNode_memory" {
  default     = 4
  description = "Domain name"
}

variable "vm_WorkerNode_disk" {
  default     = 30
  description = "Domain name"
}

variable "vm_Ingress_count" {
  default     = 1
  description = "Domain name"
}

variable "vm_Ingress_cores" {
  default     = 1
  description = "Domain name"
}

variable "vm_Ingress_memory" {
  default     = 2
  description = "Domain name"
}

variable "vm_Ingress_disk" {
  default     = 10
  description = "Domain name"
}
