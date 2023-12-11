(*type event = {
  id : string;
  event_type: string;
  data : string;
  metadata : string option;
  is_json : bool option;
}


type stream = string


type connection_options = {
  username : string;
  password : string;
  host : string;
  port : int;
}

type connection_status =
  | Connected
  | Disconnected

type user_credentials = {
  username : string;
  password : string;
}

type t

(** [connect options] establishes a connection to the EventStoreDB server
    with the given [options]. *)
val connect : connection_options -> t

(** [disconnect client] closes the connection to the EventStoreDB server. *)
val disconnect : t -> unit

type stream_position =
| Start
| End
| Exact of int

type stream_state = 
| Any
| NoStream
| StreamExists
| Exact of stream_position

type stream_direction =
| Forward
| Backward

(** [read_stream client stream direction position count] reads [count] events
    from the given [stream] in the given [direction] starting at the given
    [position]. *)
val read_stream : t -> stream -> stream_direction -> position -> int -> event list

val read_stream_sequence : t -> stream -> stream_direction -> position -> int -> event Seq.t

(** [read_all client direction position count] reads [count] events from all
    streams in the given [direction] starting at the given [position]. *)

(** [append_to_stream client stream events] appends the given [events] to the
    [stream] in the EventStoreDB server. *)
val append_to_stream : t -> stream -> event list -> ?:stream_state -> ?:user_credentials -> unit

val append_sequence_to_stream : t -> stream -> event Seq.t -> int -> ?:stream_state -> ?:user_credentials -> unit

(** [delete_stream client stream] deletes the given [stream] from the
    EventStoreDB server. *)*)