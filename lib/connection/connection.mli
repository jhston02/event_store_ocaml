type t

exception Invalid_connection_string of string

val parse_connection_string: string -> t