# Pet проект для закрепления навыков

Проект предназначен для архитектуры на базе VmWare Workstation.

## Подготовка инфраструктуры

Потребуется создать шаблон виртуальной машины на базе `Ubuntu`:

``` packer
$ cd 01-packer
$ cp variables.json.example variables.json
$ cat variables.json
{
    "vm-name": "Ubuntu-20.04-LTS",
    "vm-cpu-num": "2",
    "vm-mem-size": "2048",
    "vm-disk-size": "10240",
    "iso-url": "http://releases.ubuntu.com/20.04/ubuntu-20.04.2-live-server-amd64.iso",
    "iso-checksum": "d1f2bf834bbe9bb43faf16f9be992a6f3935e65be0edece1dee2aa6eb1767423",
    "iso-checksum-type": "sha256"
}
$ packer build -var-file variables.json packer.json
```

В результате создания мы получим шаблон на базе `Ubuntu Server 20.04`, обновленный и подготовленный для дальнейшего использования при создании виртуальных машин. Учетные данные для авторизации - `ubuntu`/`ubuntu`. Крайне рекомендуется их поменять после создания виртуальной машины на базе созданного образа.

Создадим 4 виртуальные машины: `Ingress`, `Master`, `Node-1`, `Node-2`.

Теперь потребуется установить `Kubernetes`.

``` bash
cd 02-ansible
sudo pip install -r kubespray/requirements.txt
ansible-playbook -b kubespray/cluster.yml
```
