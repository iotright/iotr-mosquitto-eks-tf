
# resource "kubernetes_namespace_v1" "mosquitto" {
#   metadata {
#     annotations = {
#       name = "some-value"
#     }
#     labels = {
#       alabel = "label-value"
#     }

#     name = "mosquitto"
#   }

# }

resource "helm_release" "mosquitto" {
  name             = "mosquitto"
  # repository            = "https://storage.googleapis.com/t3n-helm-charts"
  # chart = "t3n/mosquitto"
  chart = "./Chart.yaml"
  version = "2.4.1"
  namespace        = "mosquitto"
  create_namespace = true
  values = [
    # ${yamlencode({
    #   "image.pullPolicy": "always",

    # })}
    templatefile("./values.yml", {environment = var.environment, svcAcctName = ${local.svcAcctName} serviceName = ${local.serviceName}, storageClassName = kubernetes_storage_class_v1.ebs_cs_as_sc.metadata.[0].name, })
  ]
}

# honeycomb.yml

# agent:
#   watchers:
#     - labelSelector: "app=my-app"
#       namespace: my-namespace
#       dataset: "${env}"
#       parser:
#         name: nginx
#         dataset: "${env}"
#         options:
#           log_format: "blah"

# ${yamlencode({
#   "backends": [for addr in ip_addrs : "${addr}:${port}"],
# })}

# templatefile 
  # values = [
  #   templatefile("modules/kubernetes/helm/honeycomb.yml", { env = "${var.env}" })
  # ]