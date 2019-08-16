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
        q = "avg:redisenterprise.bdb_used_memory{*} by {bdb}/avg:redisenterprise.redis_maxmemory{*} by {bdb}"
        display_type = "area"
      }
      title = "Memory Usage"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_no_of_keys{*} by {bdb}"
        display_type = "area"
      }
      title = "Key Count"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_conns{*} by {bdb}"
        display_type = "area"
      }
      title = "DB Connections"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_total_req{*} by {bdb}"
        display_type = "area"
      }
      title = "Total Requests per Second"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_avg_write_latency{*} by {bdb}"
        display_type = "area"
      }
      title = "Write Latency"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.bdb_avg_read_latency{*} by {bdb}"
        display_type = "area"
      }
      title = "Read Latency"
    }
  }

  widget {
    timeseries_definition {
      request {
        q = "avg:redisenterprise.redis_mem_fragmentation_ratio{*} by {bdb}"
        display_type = "area"
      }
      title = "% Memory Fragmentation"
    }
  }

  template_variable {
    name   = "cluster"
    prefix   = "cluster"
    default = "*"
  }
  template_variable {
    name   = "bdb"
    prefix = "bdb"
    default = "*"
  }

}