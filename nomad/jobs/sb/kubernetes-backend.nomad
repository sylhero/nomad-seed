job "kubernetes" {
  datacenters = ["TEST"]
  type = "service"
  group "backend" {
    count = 1
    restart {
      attempts = 2
      interval = "1m"
      delay = "10s"
      mode = "fail"
    }
    task "kubernetes" {
      driver = "docker"
      config {
        image = "images.ormuco.com:5000/ormuco/kubernetes-backend:ORMUCO_RELEASE"
        port_map {
          http = 3000
        }
        auth {
            username = "ORMUCO_DOCKER_USERNAME"
            password = "ORMUCO_DOCKER_PASSWORD"
        }
        force_pull = true
      }
      service {
        name = "${NOMAD_TASK_NAME}-service"
        port = "http"
        tags = ["global", "kubernetes", "urlprefix-/kubernetes"]
        check {
          name = "alive"
          type = "http"
          path = "/kubernetes/v1/health"
          interval = "10s"
          timeout  = "2s"
        }
      }
      resources {
        memory = 256 # MB
        network {
          mbits = 100
          port "http" {}
        }
      }
    }
  }
}
