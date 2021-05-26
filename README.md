# Проект по DovOps

## Как запустить

Скопируйте пример файла конфигурации Terraform и заполните переменные для доступа к облачному сервису Yandex.

``` bash
$ cp terraform/terraform.tfvars.example terraform/terraform.tfvars
$ cat terraform/terraform.tfvars
yandex_token = ""
yandex_cloud_id = ""
yandex_folder_id = ""
yandex_zone = ""
```

> Инструкции по взаимодействию Terraform и Yandex Cloud подробно описаны на странице [официальной документации](https://cloud.yandex.ru/docs/solutions/infrastructure-management/terraform-quickstart) Yandex.

## Changelog

26.05.2021 - Создание инструкций Terraform для развертывание инстансов VM в облаке.
