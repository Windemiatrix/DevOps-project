# Проект по DevOps

Проект подготовлен для использования в облачном сервисе Yandex Cloud.

## Как запустить

Скопируйте пример файла конфигурации Terraform и заполните переменные для доступа к облачному сервису Yandex.

```bash
$ cp terraform/terraform.tfvars.example terraform/terraform.tfvars
$ cat terraform/terraform.tfvars
yandex_token = ""
yandex_cloud_id = ""
yandex_folder_id = ""
yandex_zone = ""

vm_name = "" # Префикс названия ВМ
vm_image_id = "" # ID образа ВМ (берется из Яндекса)

vm_user = "" # Пользователь в ВМ (по умолчанию ubuntu)
vm_ssh_keyfile = "" # Путь до публичного ключа RSA (по умолчанию ~/.ssh/id_rsa.pub)
vm_ssh_keyfile_private = "" # Путь до приватного ключа RSA (по умолчанию ~/.ssh/id_rsa)

# Характеристики для создаваемых ВМ
vm_MasterNode_count = 3
vm_MasterNode_cores = 2
vm_MasterNode_memory = 4
vm_MasterNode_disk = 10

vm_WorkerNode_count = 2
vm_WorkerNode_cores = 2
vm_WorkerNode_memory = 4
vm_WorkerNode_disk = 20

vm_Ingress_count = 1
vm_Ingress_cores = 2
vm_Ingress_memory = 2
vm_Ingress_disk = 3
```

> Инструкции по взаимодействию Terraform и Yandex Cloud подробно описаны на странице [официальной документации](https://cloud.yandex.ru/docs/solutions/infrastructure-management/terraform-quickstart) Yandex.

Также необходимо установить зависимости, необходимые для работы Kubespray:

``` bash
sudo pip3 install -r ansible/kubespray/requirements.txt
```

Далее перейдите в директорию с Terraform, выполните его инициализацию и запустите сценарий:

```bash
$ terraform init
$ terraform plan
$ terraform apply
yes
```
