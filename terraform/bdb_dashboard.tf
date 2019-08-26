provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}

resource "datadog_dashboard" "dbd_dashboard" {
  title         = "Redis Enterprise Database Dashboard"
  description   = "Created using the Datadog provider in Terraform"
  layout_type   = "free"
  is_read_only  = true

  widget {
     query_value_definition{
      request {
        q = "(avg:redise.bdb_used_memory{$db_id,$cluster_name} by {bdb}/avg:redise.bdb_memory_limit{$db_id,$cluster_name} by {bdb})*100"
        conditional_formats {
          comparator = "<"
          value = "80"
          palette = "white_on_green"
        }
        conditional_formats {
          comparator = ">"
          value = "80"
          palette = "white_on_red"
        }
      }
      title = "Memory Usage Percentage"
      precision = 2
      custom_unit = "%"
     }
    layout = {
      height = 20
      width = 50
      x = 25
      y = 5
    }
  }

#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_used_memory{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "Memory Usage"
#    }
#    layout = {
#      height = 20
#      width = 50
#      x = 85
#      y = 5
#    }
#  }

  widget {
    query_value_definition {
      request {
        q = "avg:redise.bdb_no_of_keys{$db_id,$cluster_name} by {bdb}"
      }
      title = "Key Count"
      custom_unit = "objects"
    }
    layout = {
      height = 20
      width = 50
      x = 85
      y = 5 
    }
  }

#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_conns{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "DB Connections"
#    }
#    layout = {
#      height = 43
#      width = 32
#      x = 65
#      y = 60
#    }
#  }
#
#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_total_req{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "Total Requests per Second"
#    }
#    layout = {
#      height = 43
#      width = 32
#      x = 5
#      y = 60
#    }
#  }
#
#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_avg_write_latency{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "Write Latency"
#    }
#    layout = {
#      height = 43
#      width = 32
#      x = 5
#      y = 60
#    }
#  }
#
#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_avg_read_latency{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "Read Latency"
#    }
#    layout = {
#      height = 43
#      width = 32
#      x = 5
#      y = 60
#    }
#  }
#
#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_write_req{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "Write Requests"
#    }
#    layout = {
#      height = 43
#      width = 32
#      x = 5
#      y = 60
#    }
#  }
#
#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_read_req{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "Read Requests"
#    }
#    layout = {
#      height = 43
#      width = 32
#      x = 5
#      y = 60
#    }
#  }
#
#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_evicted_objects{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "Evicted Objects"
#    }
#    layout = {
#      height = 43
#      width = 32
#      x = 5
#      y = 60
#    }
#  }
#
#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_expired_objects{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "Expired Objects"
#    }
#    layout = {
#      height = 43
#      width = 32
#      x = 5
#      y = 60
#    }
#  }
#
#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_ingress_bytes{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "Network Bytes In"
#    }
#    layout = {
#      height = 43
#      width = 32
#      x = 5
#      y = 60
#    }
#  }
#
#  widget {
#    timeseries_definition {
#      request {
#        q = "avg:redise.bdb_egress_bytes{$db_id,$cluster_name} by {bdb}"
#        display_type = "area"
#      }
#      title = "Network Bytes Out"
#    }
#    layout = {
#      height = 43
#      width = 32
#      x = 5
#      y = 60
#    }
#  }

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
