provider "hyperv" {
  user            = "Administator"
  password        = "P@ssw0rd"
  host            = "127.0.0.1"
  port            = 5986
  https           = true
  insecure        = false
  use_ntlm        = true
  script_path     = "C:/Temp/terraform_%RAND%.cmd"
  timeout         = "30s"
}

resource "hyperv_machine_instance" "default" {
  name = "WebServer"
  generation = 1
  automatic_critical_error_action = "Pause"
  automatic_critical_error_action_timeout = 30
  automatic_start_action = "StartIfRunning"
  automatic_start_delay = 0
  automatic_stop_action = "Save"
  dynamic_memory = true
  guest_controlled_cache_types = false
  high_memory_mapped_io_space = 536870912
  lock_on_disconnect = "Off"
  low_memory_mapped_io_space = 134217728
  memory_maximum_bytes = 1099511627776
  memory_minimum_bytes = 536870912
  memory_startup_bytes = 536870912
  processor_count = 2
  smart_paging_file_path = "C:\ProgramData\Microsoft\Windows\Hyper-V"
  snapshot_file_location = "C:\ProgramData\Microsoft\Windows\Hyper-V"
  state = "Running"

  network_adaptors {
    name = "wan"
    switch_name = "${hyperv_network_switch.dmz_network_switch.name}"
  }
}