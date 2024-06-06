resource "kubernetes_deployment_v1" "mosquitto" {
  metadata {
    name = "mosquitto"
    labels = {
      app = "mosquitto"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "mosquitto"
      }
    }

    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          app = "mosquitto"
        }
      }

      spec {
        service_account_name = data.terraform_remote_state.terraform_addons.outputs.ebs_csi_controller_sa_name
        container {
          image = "eclipse-mosquitto:latest"
          name  = "mosquitto"

          port {
            container_port = 1883
          }

          port {
            container_port = 9001
          }

          volume_mount {
            name       = "mosquitto-persistent-storage"
            mount_path = "/mosquitto/data"
          }

          volume_mount {
            name       = "mosquitto-config"
            mount_path = "/mosquitto/config/mosquitto.conf"
            sub_path   = "mosquitto.conf"
          }
        }

        volume {
          name = "mosquitto-persistent-storage"

          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim_v1.mq_pv_claim.metadata.0.name
          }
        }

        volume {
          name = "mosquitto-config"

          config_map {
            name = kubernetes_config_map_v1.mosquitto_config.metadata.0.name
          }
        }
      }
    }
  }
}
