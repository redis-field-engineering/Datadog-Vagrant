resource "datadog_dashboard" "crdb_dashboard" {
  title        = "Redis Enterprise Active/Active Dashboard"
  description  = "Created using the Datadog provider in Terraform"
  layout_type  = "free"
  is_read_only = true

  widget {
    query_value_definition {
      request {
        q = "(avg:redise.bdb_crdt_syncer_status{$cluster_name} by {crdt_guid})*100"
        conditional_formats {
          comparator = "<"
          value      = "1"
          palette    = "white_on_green"
        }
        conditional_formats {
          comparator = ">="
          value      = "1"
          palette    = "black_on_light_yellow"
        }
        conditional_formats {
          comparator = ">="
          value      = "2"
          palette    = "white_on_red"
        }
      }
      title     = "Sync Status"
      precision = 2
    }
    widget_layout {
      height = 10
      width  = 90
      x      = 0
      y      = 0
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:redise.bdb_crdt_syncer_ingress_bytes{$cluster_name} by {crdt_guid}"
        display_type = "area"
      }
      title = "Syncer Ingress"
    }
    widget_layout {
      height = 10
      width  = 45
      x      = 0
      y      = 11
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:redise.bdb_crdt_syncer_egress_bytes{$cluster_name} by {crdt_guid}"
        display_type = "area"
      }
      title = "Syncer Egress"
    }
    widget_layout {
      height = 10
      width  = 45
      x      = 47
      y      = 11
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:redise.bdb_crdt_syncer_ingress_bytes_decompressed{$cluster_name} by {crdt_guid}"
        display_type = "area"
      }
      title = "Syncer Ingress Decompressed"
    }
    widget_layout {
      height = 10
      width  = 45
      x      = 0
      y      = 22
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:redise.bdb_crdt_syncer_egress_bytes_decompressed{$cluster_name} by {crdt_guid}"
        display_type = "area"
      }
      title = "Syncer Egress Decompressed"
    }
    widget_layout {
      height = 10
      width  = 45
      x      = 47
      y      = 22
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:redise.bdb_crdt_syncer_pending_local_writes_max{$cluster_name} by {crdt_guid}"
        display_type = "area"
      }
      title = "Max Pending Writes"
    }
    widget_layout {
      height = 10
      width  = 45
      x      = 0
      y      = 33
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:redise.bdb_crdt_syncer_pending_local_writes_min{$cluster_name} by {crdt_guid}"
        display_type = "area"
      }
      title = "Min Pending Writes"
    }
    widget_layout {
      height = 10
      width  = 45
      x      = 47
      y      = 33
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:redise.bdb_crdt_syncer_local_ingress_lag_time{$cluster_name} by {crdt_guid}"
        display_type = "area"
      }
      title = "Sync Lag Time"
    }
    widget_layout {
      height = 10
      width  = 90
      x      = 0
      y      = 44
    }
  }


  template_variable {
    name    = "cluster_name"
    prefix  = "cluster"
    default = "*"
  }

}
