data "template_file" "docker" {
    template = file("../ansible/docker/install.yml.tpl")
    vars = {
        username = var.vm_user
    }
}

resource "local_file" "docker" {
  content  = data.template_file.docker.rendered
  filename = "../ansible/docker/install.yml"
}