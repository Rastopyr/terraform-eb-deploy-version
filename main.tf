
locals {
  command = "bash ${path.module}/bin/build.sh ${var.application_name} ${var.environment_name} ${var.version_label} ${var.source_bucket} ${var.source_key} ${var.file_path} ${var.region}"
}

resource "null_resource" "deploy_version" {
  triggers {
    build_folder_content_md5 = "${md5(local.command)}"
  }

  provisioner "local-exec" {
    command = "${local.command}"
  }
}
