# Changelog

## 26.05.2021

- Создание инструкций Terraform для развертывание инстансов VM в облаке.

## 27.05.2021

- Готовая инфраструктура в облаке для развертывания Kubernetes.
- Ansible playbook для установки docker, удаления swap, обновления APT, удаления не нужных пакетов и кэша.
- Реализация провижинеров в Terraform для ожидания доступности инстансов ВМ по ssh.
- Создание inventory файла через docker средствами Terraform для Kubespray.
- Реализация провижинера для запуска установки реализованного Ansible playbook.

## 31.05.2021

- Выделение changelog в отдельный файл.
- Добавление версий пакетов в Ansible playbook и конфигурацию Terraform.
- Изменение манифеста установки docker. Прейбук конфигурируется через Terraform (подставляется создаваемый пользователь); фиксируются установленные пакеты docker.
