open Containers

exception Invalid_connection_string of string

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

(* Parse delimiters *)
let scheme_seperator = "://" 
let user_info_separator = '@' 

let slash = '/' 
let comma = "," 
let ampersand = "&"
let equal = "="
let colon = ":"
let question_mark = '?'

(* Settings *)
let _tls = "tls" 
let connection_name = "ConnectionName"
let max_discover_attempts = "MaxDiscoverAttempts"
let discovery_interval = "DiscoveryInterval"
let gossip_timeout = "GossipTimeout"
let node_preference = "NodePreference"
let tls_verify_cert = "TlsVerifyCert"
let _default_deadline = "DefaultDeadline"
let throw_on_append_failure = "ThrowOnAppendFailure"
let keep_alive_interval = "KeepAliveInterval"
let keep_alive_timeout = "KeepAliveTimeout"

let uri_scheme_discover = "esdb+discover"

let valid_schemes = ["esdb"; uri_scheme_discover]

let default_port = 2113
let _default_use_tls = true


let association_with_default key parser default options= 
    match List.assoc_opt ~eq:String.equal_caseless key options with
    | Some value -> parser value
    | None -> default

let parse_node_preference preference =
  match preference with
  | "leader" -> Leader
  | "follower" -> Follower
  | "random" -> Random
  | _ -> raise (Invalid_connection_string "Invalid node preference")

let check_scheme scheme =
  if List.mem scheme valid_schemes then
    scheme
  else
    raise (Invalid_connection_string "Invalid scheme")

let parse_credentials credentials =
  match String.split ~by:colon credentials with
  | [username; password] -> { username; password }
  | _ -> raise (Invalid_connection_string "Invalid credentials")

let parse_hosts hosts =
  hosts |> String.split ~by:comma |> List.map (fun host -> 
    match String.split ~by:colon host with
    | [host; port] -> host, (port |> int_of_string)
    | [host] -> host, default_port
    | _ -> raise (Invalid_connection_string "Invalid host supplied")
  ) |> List.map (fun (host, port) ->
        let slash_index = String.index host slash in
        if slash_index <> -1 then
          (*Strip trailing slash*)
          String.sub host 0 (slash_index), port
        else
          host, port
  )

let parse_connectivity_settings settings =
  let max_discover_attempts = association_with_default max_discover_attempts int_of_string 10 settings in
  let discovery_interval = association_with_default discovery_interval int_of_string 100 settings in
  let gossip_timeout = association_with_default gossip_timeout int_of_string 5000 settings in
  let node_preference = association_with_default node_preference parse_node_preference Leader settings in
  let tls_verify_cert = association_with_default tls_verify_cert bool_of_string true settings in
  let keep_alive_interval = association_with_default keep_alive_interval int_of_string 10000  settings in
  let keep_alive_timeout = association_with_default keep_alive_timeout int_of_string 10000 settings in

  {
    max_discover_attempts;
    discovery_interval;
    gossip_timeout;
    node_preference;
    keep_alive_interval;
    keep_alive_timeout;
    tls_verify_cert;
  }

let parse_operation_options options = 
  let throw_on_append_failure = association_with_default throw_on_append_failure int_of_string 0 options in
  let batch_append = 3 * 1024 * 1024 in

  {
    throw_on_append_failure;
    batch_append;
  }

let parse_connection_string connection_string =
  let _, rest = 
    match String.split ~by:scheme_seperator connection_string with
    | [scheme; rest] -> (scheme |> check_scheme), rest
    | _ -> raise (Invalid_connection_string "Must include scheme")
  in
  let credentials, rest = 
    match String.index rest user_info_separator with
    | -1 -> None, rest
    | x -> parse_credentials (String.sub rest 0 x) |> Option.some, String.sub rest (x + 1) (String.length rest - x - 1)
  in
  let _, rest = 
    match String.index rest question_mark with
    | -1 -> parse_hosts rest, ""
    | x -> parse_hosts (String.sub rest 0 x), String.sub rest (x + 1) (String.length rest - x - 1)
  in
  let connection_params = 
    match String.split ~by:ampersand rest with
    | [] -> []
    | params -> params |> List.map (fun param ->
      match String.split ~by:equal param with
      | [key; value] -> key, value
      | _ -> raise (Invalid_connection_string "Invalid connection string")
    )
    in 
  let operation_options = parse_operation_options connection_params in
  let connectivity_settings = parse_connectivity_settings connection_params in
  let connection_name = association_with_default connection_name Fun.id "" connection_params in
  {
    credentials;
    connectivity_settings;
    default_timeout = 5000;
    operation_options;
    connection_name;
  }