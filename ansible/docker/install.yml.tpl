---
- hosts: all
  become: true

  tasks:
    - name: Update and upgrade apt packages
      apt:
        upgrade: yes
        update_cache: yes

    - name: Install packages that allow apt to be used over HTTPS
      apt:
        name: "{{ packages }}"
        state: present
        update_cache: yes
      vars:
        packages:
          - apt-transport-https
          - ca-certificates
          - curl
          - gnupg
          - lsb-release

    - name: Add an apt signing key for Docker
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Add apt repository for stable version
      apt_repository:
        repo: deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
        state: present

    - name: Install docker and its dependecies
      apt:
        name: "{{ packages }}"
        state: present
        update_cache: yes
      vars:
        packages:
          - docker-ce=5:19.03.9~3-0~ubuntu-focal
          - docker-ce-cli=5:19.03.9~3-0~ubuntu-focal
          - containerd.io=1.4.4-1
      notify:
        - docker status

    - name: Prevent docker-ce from being updated
      dpkg_selections:
        name: docker-ce
        selection: hold

    - name: Prevent docker-ce-cli from being updated
      dpkg_selections:
        name: docker-ce-cli
        selection: hold

    - name: Prevent containerd.io from being updated
      dpkg_selections:
        name: containerd.io
        selection: hold

    - name: Add ${username} user to docker group
      user:
        name: ${username}
        group: docker

    - name: Remove swapfile from /etc/fstab
      mount:
        name: "{{ item }}"
        fstype: swap
        state: absent
      with_items:
        - swap
        - none

    - name: Disable swap
      command: swapoff -a
      when: ansible_swaptotal_mb > 0

    - name: APT remove unused dependency packages
      become: true
      apt:
        autoremove: yes

    - name: APT cleans the local repository of retrieved package files
      become: true
      apt:
        autoclean: yes

    - name: Apt - Removes all packages from the package cache
      command:
        cmd: apt-get clean
        warn: false

  handlers:
    - name: docker status
      service: name=docker state=started
