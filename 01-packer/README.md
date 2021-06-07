# Ubuntu 20.04 server template

## Ubuntu autoinstall

Ubuntu server, like a debian, supports autoinstall. Additional information you can find on [official documtntation](https://ubuntu.com/server/docs/install/autoinstall).

Github repositories, that could help to modification configuration:

- <https://github.com/Praseetha-KR/packer-ubuntu>;
- <https://github.com/quarkslab/packer-ubuntu>.

Files with configuration located are located in directory `http`.

### File `user-data`

the most important directives are:

- packets, that should be installed;
- updating system from repositories;
- creating user and adding it to sudoers file.

Credentials for authentication: `ubuntu`/`ubuntu`.

## Packer configuration

The most important directives are in the provisioner:

``` yml
    "provisioners": [
        {
            "inline": [
                "sudo sh -c \"echo 'disable_vmware_customization: false' >> /etc/cloud/cloud.cfg\"",
                "sudo sh -c \"echo 'log = true' >> /etc/vmware-tools/tools.conf\"",
                "sudo rm -rf /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
                "sudo rm -rf /etc/cloud/cloud.cfg.d/99-installer.cfg",
                "sudo rm -rf /etc/netplan/50-cloud-init.yaml",
                "sudo sed -i 's/preserve_hostname: false/preserve_hostname: true/g' /etc/cloud/cloud.cfg",
                "sudo truncate -s0 /etc/hostname",
                "sudo hostnamectl set-hostname localhost",
                "sudo apt-get purge cloud-init --yes",
                "sudo apt-get autoremove --purge --yes"
            ],
            "type": "shell"
        }
    ]
```

This block is needed for supporting VMWare template customization.

Additional information you can find in vmware knowlenge base:

- <https://kb.vmware.com/s/article/80934>;
- <https://kb.vmware.com/s/article/59557>.

Also for me was helpful [this](https://docs.microsoft.com/ru-ru/azure/cloud-adoption-framework/manage/hybrid/server/best-practices/vmware-ubuntu-template) article.
