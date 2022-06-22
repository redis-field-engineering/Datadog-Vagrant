resource "datadog_monitor" "no_conns" {
  name               = "Redis Enterprise has no connections"
  type               = "metric alert"
  message            = "There are no connections the the Redis Enterprise Database"
  escalation_message = "Some escalation notification goes here"

  query = "avg(last_15m):avg:redise.bdb_conns{*} by {bdb} < 1"

  monitor_thresholds {
    ok                = 0
    critical          = 1
    warning           = 2
    critical_recovery = 3
    warning_recovery  = 4
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 24
  include_tags = true

  tags = ["redise"]
}

resource "datadog_monitor" "high_db_latency" {
  name               = "Redis Enterprise Latency Alert"
  type               = "metric alert"
  message            = "Redis Operations are taking too long, check the slow log"
  escalation_message = "Some escalation notification goes here"

  query = "avg(last_15m):avg:redise.bdb_avg_latency{*} by {bdb} > 0.01"

  monitor_thresholds {
    ok       = 0.005
    critical = 0.01
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 24
  include_tags = true

  tags = ["redise"]
}

resource "datadog_monitor" "db_eviction" {
  name               = "Redis Enterprise Eviction Alert"
  type               = "metric alert"
  message            = "Redis is out of memory so keys are being evicted"
  escalation_message = "Some escalation notification goes here"

  query = "avg(last_5m):avg:redise.bdb_evicted_objects{*} by {bdb} > 0"

  monitor_thresholds {
    ok       = 0
    critical = 0.0
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 24
  include_tags = true

  tags = ["redise"]
}

resource "datadog_monitor" "db_usage" {
  name               = "Redis Enterprise Usage Alert"
  type               = "metric alert"
  message            = "Redis is running out of memory"
  escalation_message = "Some escalation notification goes here"

  query = "avg(last_5m):( avg:redise.bdb_used_memory{*} by {bdb} / avg:redise.bdb_memory_limit{*} by {bdb} ) * 100 > 85"

  monitor_thresholds {
    warning  = 80
    critical = 85
  }
  #
  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 24
  include_tags = true

  tags = ["redise"]
}
