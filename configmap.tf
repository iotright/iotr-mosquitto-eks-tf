resource "kubernetes_config_map_v1" "mosquitto_config" {
  metadata {
    name = "mosquitto-config"
  }

  data = {
    "mosquitto.conf" = <<-EOF
      listener 1883
      persistence true
      persistence_location /mosquitto/data/
      log_dest file /mosquitto/log/mosquitto.log
      allow_anonymous true
    EOF
  }
}
