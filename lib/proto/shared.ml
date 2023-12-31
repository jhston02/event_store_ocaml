(************************************************)
(*       AUTOGENERATED FILE - DO NOT EDIT!      *)
(************************************************)
(* Generated by: ocaml-protoc-plugin            *)
(* https://github.com/issuu/ocaml-protoc-plugin *)
(************************************************)
(*
  Source: shared.proto
  Syntax: proto3
  Parameters:
    debug=false
    annot=''
    opens=[]
    int64_as_int=true
    int32_as_int=true
    fixed_as_int=false
    singleton_record=false
*)

open Ocaml_protoc_plugin.Runtime [@@warning "-33"]
(**/**)
module Imported'modules = struct
  module Empty = Empty
end
(**/**)
module Event_store = struct
  module Client = struct
    module rec UUID : sig
      module rec Structured : sig
        val name': unit -> string
        type t = { most_significant_bits: int; least_significant_bits: int } 
        val make : ?most_significant_bits:int -> ?least_significant_bits:int -> unit -> t
        val to_proto: t -> Runtime'.Writer.t
        val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
      end
      val name': unit -> string
      type t = [ `not_set | `Structured of UUID.Structured.t | `String of string ] 
      val make : ?value:[ `not_set | `Structured of UUID.Structured.t | `String of string ] -> unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      module rec Structured : sig
        val name': unit -> string
        type t = { most_significant_bits: int; least_significant_bits: int } 
        val make : ?most_significant_bits:int -> ?least_significant_bits:int -> unit -> t
        val to_proto: t -> Runtime'.Writer.t
        val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
      end = struct 
        let name' () = "shared.event_store.client.UUID.Structured"
        type t = { most_significant_bits: int; least_significant_bits: int }
        let make =
          fun ?most_significant_bits ?least_significant_bits () -> 
          let most_significant_bits = match most_significant_bits with Some v -> v | None -> 0 in
          let least_significant_bits = match least_significant_bits with Some v -> v | None -> 0 in
          { most_significant_bits; least_significant_bits }
        
        let to_proto =
          let apply = fun ~f:f' { most_significant_bits; least_significant_bits } -> f' [] most_significant_bits least_significant_bits in
          let spec = Runtime'.Serialize.C.( basic (1, int64_int, proto3) ^:: basic (2, int64_int, proto3) ^:: nil ) in
          let serialize = Runtime'.Serialize.serialize [] (spec) in
          fun t -> apply ~f:serialize t
        
        let from_proto =
          let constructor = fun _extensions most_significant_bits least_significant_bits -> { most_significant_bits; least_significant_bits } in
          let spec = Runtime'.Deserialize.C.( basic (1, int64_int, proto3) ^:: basic (2, int64_int, proto3) ^:: nil ) in
          let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
          fun writer -> deserialize writer |> Runtime'.Result.open_error
        
      end
      let name' () = "shared.event_store.client.UUID"
      type t = [ `not_set | `Structured of UUID.Structured.t | `String of string ]
      let make =
        fun ?value () -> 
        let value = match value with Some v -> v | None -> `not_set in
        value
      
      let to_proto =
        let apply = fun ~f:f' value -> f' [] value in
        let spec = Runtime'.Serialize.C.( oneof ((function | `not_set -> failwith "This case should never _ever_ happen" | `Structured v -> oneof_elem (1, (message (fun t -> UUID.Structured.to_proto t)), v) | `String v -> oneof_elem (2, string, v))) ^:: nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions value -> value in
        let spec = Runtime'.Deserialize.C.( oneof ([ oneof_elem (1, (message (fun t -> UUID.Structured.from_proto t)), fun v -> `Structured v); oneof_elem (2, string, fun v -> `String v) ]) ^:: nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and Empty : sig
      val name': unit -> string
      type t = unit 
      val make : unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.Empty"
      type t = unit
      let make =
        fun  () -> 
        
        ()
      
      let to_proto =
        let apply = fun ~f:f' () -> f' []  in
        let spec = Runtime'.Serialize.C.( nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions  -> () in
        let spec = Runtime'.Deserialize.C.( nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and StreamIdentifier : sig
      val name': unit -> string
      type t = bytes 
      val make : ?stream_name:bytes -> unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.StreamIdentifier"
      type t = bytes
      let make =
        fun ?stream_name () -> 
        let stream_name = match stream_name with Some v -> v | None -> (Bytes.of_string {||}) in
        stream_name
      
      let to_proto =
        let apply = fun ~f:f' stream_name -> f' [] stream_name in
        let spec = Runtime'.Serialize.C.( basic (3, bytes, proto3) ^:: nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions stream_name -> stream_name in
        let spec = Runtime'.Deserialize.C.( basic (3, bytes, proto3) ^:: nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and AllStreamPosition : sig
      val name': unit -> string
      type t = { commit_position: int; prepare_position: int } 
      val make : ?commit_position:int -> ?prepare_position:int -> unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.AllStreamPosition"
      type t = { commit_position: int; prepare_position: int }
      let make =
        fun ?commit_position ?prepare_position () -> 
        let commit_position = match commit_position with Some v -> v | None -> 0 in
        let prepare_position = match prepare_position with Some v -> v | None -> 0 in
        { commit_position; prepare_position }
      
      let to_proto =
        let apply = fun ~f:f' { commit_position; prepare_position } -> f' [] commit_position prepare_position in
        let spec = Runtime'.Serialize.C.( basic (1, uint64_int, proto3) ^:: basic (2, uint64_int, proto3) ^:: nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions commit_position prepare_position -> { commit_position; prepare_position } in
        let spec = Runtime'.Deserialize.C.( basic (1, uint64_int, proto3) ^:: basic (2, uint64_int, proto3) ^:: nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and WrongExpectedVersion : sig
      val name': unit -> string
      type t = { current_stream_revision_option: [ `not_set | `Current_stream_revision of int | `Current_no_stream of Imported'modules.Empty.Google.Protobuf.Empty.t ]; expected_stream_position_option: [ `not_set | `Expected_stream_position of int | `Expected_any of Imported'modules.Empty.Google.Protobuf.Empty.t | `Expected_stream_exists of Imported'modules.Empty.Google.Protobuf.Empty.t | `Expected_no_stream of Imported'modules.Empty.Google.Protobuf.Empty.t ] } 
      val make : ?current_stream_revision_option:[ `not_set | `Current_stream_revision of int | `Current_no_stream of Imported'modules.Empty.Google.Protobuf.Empty.t ] -> ?expected_stream_position_option:[ `not_set | `Expected_stream_position of int | `Expected_any of Imported'modules.Empty.Google.Protobuf.Empty.t | `Expected_stream_exists of Imported'modules.Empty.Google.Protobuf.Empty.t | `Expected_no_stream of Imported'modules.Empty.Google.Protobuf.Empty.t ] -> unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.WrongExpectedVersion"
      type t = { current_stream_revision_option: [ `not_set | `Current_stream_revision of int | `Current_no_stream of Imported'modules.Empty.Google.Protobuf.Empty.t ]; expected_stream_position_option: [ `not_set | `Expected_stream_position of int | `Expected_any of Imported'modules.Empty.Google.Protobuf.Empty.t | `Expected_stream_exists of Imported'modules.Empty.Google.Protobuf.Empty.t | `Expected_no_stream of Imported'modules.Empty.Google.Protobuf.Empty.t ] }
      let make =
        fun ?current_stream_revision_option ?expected_stream_position_option () -> 
        let current_stream_revision_option = match current_stream_revision_option with Some v -> v | None -> `not_set in
        let expected_stream_position_option = match expected_stream_position_option with Some v -> v | None -> `not_set in
        { current_stream_revision_option; expected_stream_position_option }
      
      let to_proto =
        let apply = fun ~f:f' { current_stream_revision_option; expected_stream_position_option } -> f' [] current_stream_revision_option expected_stream_position_option in
        let spec = Runtime'.Serialize.C.( oneof ((function | `not_set -> failwith "This case should never _ever_ happen" | `Current_stream_revision v -> oneof_elem (1, uint64_int, v) | `Current_no_stream v -> oneof_elem (2, (message (fun t -> Imported'modules.Empty.Google.Protobuf.Empty.to_proto t)), v))) ^:: oneof ((function | `not_set -> failwith "This case should never _ever_ happen" | `Expected_stream_position v -> oneof_elem (3, uint64_int, v) | `Expected_any v -> oneof_elem (4, (message (fun t -> Imported'modules.Empty.Google.Protobuf.Empty.to_proto t)), v) | `Expected_stream_exists v -> oneof_elem (5, (message (fun t -> Imported'modules.Empty.Google.Protobuf.Empty.to_proto t)), v) | `Expected_no_stream v -> oneof_elem (6, (message (fun t -> Imported'modules.Empty.Google.Protobuf.Empty.to_proto t)), v))) ^:: nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions current_stream_revision_option expected_stream_position_option -> { current_stream_revision_option; expected_stream_position_option } in
        let spec = Runtime'.Deserialize.C.( oneof ([ oneof_elem (1, uint64_int, fun v -> `Current_stream_revision v); oneof_elem (2, (message (fun t -> Imported'modules.Empty.Google.Protobuf.Empty.from_proto t)), fun v -> `Current_no_stream v) ]) ^:: oneof ([ oneof_elem (3, uint64_int, fun v -> `Expected_stream_position v); oneof_elem (4, (message (fun t -> Imported'modules.Empty.Google.Protobuf.Empty.from_proto t)), fun v -> `Expected_any v); oneof_elem (5, (message (fun t -> Imported'modules.Empty.Google.Protobuf.Empty.from_proto t)), fun v -> `Expected_stream_exists v); oneof_elem (6, (message (fun t -> Imported'modules.Empty.Google.Protobuf.Empty.from_proto t)), fun v -> `Expected_no_stream v) ]) ^:: nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and AccessDenied : sig
      val name': unit -> string
      type t = unit 
      val make : unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.AccessDenied"
      type t = unit
      let make =
        fun  () -> 
        
        ()
      
      let to_proto =
        let apply = fun ~f:f' () -> f' []  in
        let spec = Runtime'.Serialize.C.( nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions  -> () in
        let spec = Runtime'.Deserialize.C.( nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and StreamDeleted : sig
      val name': unit -> string
      type t = StreamIdentifier.t option 
      val make : ?stream_identifier:StreamIdentifier.t -> unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.StreamDeleted"
      type t = StreamIdentifier.t option
      let make =
        fun ?stream_identifier () -> 
        
        stream_identifier
      
      let to_proto =
        let apply = fun ~f:f' stream_identifier -> f' [] stream_identifier in
        let spec = Runtime'.Serialize.C.( basic_opt (1, (message (fun t -> StreamIdentifier.to_proto t))) ^:: nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions stream_identifier -> stream_identifier in
        let spec = Runtime'.Deserialize.C.( basic_opt (1, (message (fun t -> StreamIdentifier.from_proto t))) ^:: nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and Timeout : sig
      val name': unit -> string
      type t = unit 
      val make : unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.Timeout"
      type t = unit
      let make =
        fun  () -> 
        
        ()
      
      let to_proto =
        let apply = fun ~f:f' () -> f' []  in
        let spec = Runtime'.Serialize.C.( nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions  -> () in
        let spec = Runtime'.Deserialize.C.( nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and Unknown : sig
      val name': unit -> string
      type t = unit 
      val make : unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.Unknown"
      type t = unit
      let make =
        fun  () -> 
        
        ()
      
      let to_proto =
        let apply = fun ~f:f' () -> f' []  in
        let spec = Runtime'.Serialize.C.( nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions  -> () in
        let spec = Runtime'.Deserialize.C.( nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and InvalidTransaction : sig
      val name': unit -> string
      type t = unit 
      val make : unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.InvalidTransaction"
      type t = unit
      let make =
        fun  () -> 
        
        ()
      
      let to_proto =
        let apply = fun ~f:f' () -> f' []  in
        let spec = Runtime'.Serialize.C.( nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions  -> () in
        let spec = Runtime'.Deserialize.C.( nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and MaximumAppendSizeExceeded : sig
      val name': unit -> string
      type t = int 
      val make : ?maxAppendSize:int -> unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.MaximumAppendSizeExceeded"
      type t = int
      let make =
        fun ?maxAppendSize () -> 
        let maxAppendSize = match maxAppendSize with Some v -> v | None -> 0 in
        maxAppendSize
      
      let to_proto =
        let apply = fun ~f:f' maxAppendSize -> f' [] maxAppendSize in
        let spec = Runtime'.Serialize.C.( basic (1, uint32_int, proto3) ^:: nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions maxAppendSize -> maxAppendSize in
        let spec = Runtime'.Deserialize.C.( basic (1, uint32_int, proto3) ^:: nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
    and BadRequest : sig
      val name': unit -> string
      type t = string 
      val make : ?message:string -> unit -> t
      val to_proto: t -> Runtime'.Writer.t
      val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    end = struct 
      let name' () = "shared.event_store.client.BadRequest"
      type t = string
      let make =
        fun ?message () -> 
        let message = match message with Some v -> v | None -> {||} in
        message
      
      let to_proto =
        let apply = fun ~f:f' message -> f' [] message in
        let spec = Runtime'.Serialize.C.( basic (1, string, proto3) ^:: nil ) in
        let serialize = Runtime'.Serialize.serialize [] (spec) in
        fun t -> apply ~f:serialize t
      
      let from_proto =
        let constructor = fun _extensions message -> message in
        let spec = Runtime'.Deserialize.C.( basic (1, string, proto3) ^:: nil ) in
        let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
        fun writer -> deserialize writer |> Runtime'.Result.open_error
      
    end
  end
end