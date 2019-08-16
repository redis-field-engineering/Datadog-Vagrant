provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}

resource "datadog_dashboard" "dbd_dashboard" {
  title         = "Redis Enterprise Database Dashboard"
  description   = "Created using the Datadog provider in Terraform"
  layout_type   = "ordered"
  is_read_only  = false

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_used_memory{$db_id,$cluster_name} by {bdb}"
        display_type = "area"
      }
      title = "Memory Usage"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_no_of_keys{$db_id,$cluster_name} by {bdb}"
        display_type = "area"
      }
      title = "Key Count"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_conns{$db_id,$cluster_name} by {bdb}"
        display_type = "area"
      }
      title = "DB Connections"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_total_req{$db_id,$cluster_name} by {bdb}"
        display_type = "area"
      }
      title = "Total Requests per Second"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_avg_write_latency{$db_id,$cluster_name} by {bdb}"
        display_type = "area"
      }
      title = "Write Latency"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_avg_read_latency{$db_id,$cluster_name} by {bdb}"
        display_type = "area"
      }
      title = "Read Latency"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_ingress_bytes{$db_id,$cluster_name} by {bdb}"
        display_type = "area"
      }
      title = "Network Bytes In"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_egress_bytes{$db_id,$cluster_name} by {bdb}"
        display_type = "area"
      }
      title = "Network Bytes Out"
    }
  }

  template_variable {
    name   = "db_id"
    prefix = "bdb"
    default = "*"
  }

  template_variable {
    name   = "cluster_name"
    prefix = "cluster"
    default = "*"
  }

}