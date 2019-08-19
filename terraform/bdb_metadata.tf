resource "datadog_metric_metadata" "bdb_avg_latency" {
  metric      = "redise.bdb_avg_latency"
  short_name  = "Redis Enterprise Database Average Latency"
  description = "Number of seconds from when request hits proxy until results are returned"
  type        = "gauge"
  unit        = "second"
}

resource "datadog_metric_metadata" "bdb_avg_latency_max" {
  metric      = "redise.bdb_avg_latency_max"
  short_name  = "Redis Enterprise Database Average Latency Max"
  description = "Maximum number of seconds from when request hits proxy until results are returned"
  type        = "gauge"
  unit        = "second"
}

resource "datadog_metric_metadata" "bdb_avg_read_latency" {
  metric      = "redise.bdb_avg_read_latency"
  short_name  = "Redis Enterprise Database Average Read Latency"
  description = "Number of seconds from when a read request hits proxy until results are returned"
  type        = "gauge"
  unit        = "second"
}

resource "datadog_metric_metadata" "bdb_avg_write_latency" {
  metric      = "redise.bdb_avg_write_latency"
  short_name  = "Redis Enterprise Database Average Write Latency"
  description = "Number of seconds from when a write request hits proxy until results are returned"
  type        = "gauge"
  unit        = "second"
}

resource "datadog_metric_metadata" "bdb_conns" {
  metric      = "redise.bdb_conns"
  short_name  = "Redis Enterprise Database Number of Client Connections"
  description = "Number of clients currently connected to the database"
  type        = "gauge"
  unit        = "connection"
}

resource "datadog_metric_metadata" "bdb_egress_bytes" {
  metric      = "redise.bdb_egress_bytes"
  short_name  = "Redis Enterprise Database Bytes Sent"
  description = "Amount of network traffic sent by the database"
  type        = "gauge"
  unit        = "byte"
}

resource "datadog_metric_metadata" "bdb_evicted_objects" {
  metric      = "redise.bdb_evicted_objects"
  short_name  = "Redis Enterprise Database Object Evicted"
  description = "Number of items evicted from the cache"
  type        = "gauge"
  unit        = "item"
}

resource "datadog_metric_metadata" "bdb_expired_objects" {
  metric      = "redise.bdb_expired_objects"
  short_name  = "Redis Enterprise Database Object Expired"
  description = "Number of items expired from the cache"
  type        = "gauge"
  unit        = "item"
}

resource "datadog_metric_metadata" "bdb_fork_cpu_system" {
  metric      = "redise.bdb_fork_cpu_system"
  short_name  = "Redis Enterprise Database CPU Fork"
  description = "% cores utilization in system mode for all redis shard fork child processes of this database"
  type        = "gauge"
  unit        = "percent"
}

resource "datadog_metric_metadata" "bdb_ingress_bytes" {
  metric      = "redise.bdb_ingress_bytes"
  short_name  = "Redis Enterprise Database Bytes Received"
  description = "Amount of network traffic received by the database"
  type        = "gauge"
  unit        = "byte"
}

resource "datadog_metric_metadata" "bdb_main_thread_cpu_system" {
  metric      = "redise.bdb_main_thread_cpu_system"
  short_name  = "Redis Enterprise Database CPU System"
  description = "% cores utilization in system mode for all redis shard main threas of this database"
  type        = "gauge"
  unit        = "percent"
}

resource "datadog_metric_metadata" "bdb_main_thread_cpu_system_max" {
  metric      = "redise.bdb_main_thread_cpu_system_max"
  short_name  = "Redis Enterprise Database CPU System Max"
  description = "Highest value of % cores utilization in system mode for all redis shard main threas of this database"
  type        = "gauge"
  unit        = "percent"
}

resource "datadog_metric_metadata" "bdb_memory_limit" {
  metric      = "redise.bdb_memory_limit"
  short_name  = "Redis Enterprise Database Memory Limit"
  description = "Number of bytes allocated to this database"
  type        = "gauge"
  unit        = "byte"
}

resource "datadog_metric_metadata" "bdb_no_of_keys" {
  metric      = "redise.bdb_no_of_keys"
  short_name  = "Redis Enterprise Database Key Count"
  description = "Number of keys in the database"
  type        = "gauge"
  unit        = "item"
}

resource "datadog_metric_metadata" "bdb_other_req" {
  metric      = "redise.bdb_other_req"
  short_name  = "Redis Enterprise Other Request Count"
  description = "Rate of other (non read/write) requests on DB (ops/sec) ie: PING, ECHO etc"
  type        = "gauge"
  unit        = "operation"
  per_unit    = "second"
}

resource "datadog_metric_metadata" "bdb_read_req" {
  metric      = "redise.bdb_read_req"
  short_name  = "Redis Enterprise Read Request Count"
  description = "Rate of read requests on DB (ops/sec)"
  type        = "gauge"
  unit        = "operation"
  per_unit    = "second"
}

resource "datadog_metric_metadata" "bdb_shard_cpu_system" {
  metric      = "redise.bdb_shard_cpu_system"
  short_name  = "Redis Enterprise Shard CPU System"
  description = "% cores utilization in system mode for all redis shard processes of this database"
  type        = "gauge"
  unit        = "percent"
}

resource "datadog_metric_metadata" "bdb_shard_cpu_system_max" {
  metric      = "redise.bdb_shard_cpu_system_max"
  short_name  = "Redis Enterprise Shard CPU System Max"
  description = "Highest Value of % cores utilization in system mode for all redis shard processes of this database"
  type        = "gauge"
  unit        = "percent"
}

resource "datadog_metric_metadata" "bdb_total_req" {
  metric      = "redise.bdb_total_req"
  short_name  = "Redis Enterprise Total Request Count"
  description = "Rate of all requests on DB (ops/sec)"
  type        = "gauge"
  unit        = "operation"
  per_unit    = "second"
}

resource "datadog_metric_metadata" "bdb_total_req_max" {
  metric      = "redise.bdb_total_req_max"
  short_name  = "Redis Enterprise Total Request Count Max"
  description = "Highes value of rate of all requests on DB (ops/sec)"
  type        = "gauge"
  unit        = "operation"
  per_unit    = "second"
}

resource "datadog_metric_metadata" "bdb_used_memory" {
  metric      = "redise.bdb_used_memory"
  short_name  = "Redis Enterprise Database Used Memory"
  description = "Amount of memory in use for the database"
  type        = "gauge"
  unit        = "byte"
}

resource "datadog_metric_metadata" "bdb_write_req" {
  metric      = "redise.bdb_write_req"
  short_name  = "Redis Enterprise Write Request Count"
  description = "Rate of write requests on DB (ops/sec)"
  type        = "gauge"
  unit        = "operation"
  per_unit    = "second"
}

resource "datadog_metric_metadata" "listener_acc_latency" {
  metric      = "redise.listener_acc_latency"
  short_name  = "Redis Enterprise Proxy Accumulative latency"
  description = "Accumulative latency of all types of commands on DB"
  type        = "gauge"
  unit        = "second"
}
