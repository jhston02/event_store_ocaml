type credentials = {
  username : string;
  password : string;
}

type node_preference = 
  | Leader
  | Follower
  | Random

type connectivity_settings = {
  max_discover_attempts : int;
  gossip_timeout : int;
  discovery_interval : int;
  node_preference : node_preference;
  keep_alive_interval : int;
  keep_alive_timeout :  int;
  tls_verify_cert : bool;
}

type operation_options = {
  throw_on_append_failure : int;
  batch_append: int; 
}

type t = {
  credentials : credentials option;
  connectivity_settings : connectivity_settings;
  default_timeout : int;
  connection_name : string;
  operation_options : operation_options;
}


exception Invalid_connection_string of string

val parse_connection_string: string -> t