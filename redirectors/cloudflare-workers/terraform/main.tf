resource "cloudflare_worker_route" "route_redirector" {
  zone_id     = var.zone_id
  pattern     = "${var.domain}/*"
  script_name = cloudflare_worker_script.redirector.name
}

resource "cloudflare_worker_script" "redirector" {
  name    = var.redirector_name
  content = data.template_file.script.rendered
}

data "template_file" "script" {
  template = file("./script.tpl")
  vars = {
    c2_ip   = var.c2_ip
    c2_port = var.c2_port
  }
}
