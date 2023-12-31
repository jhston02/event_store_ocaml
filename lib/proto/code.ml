(************************************************)
(*       AUTOGENERATED FILE - DO NOT EDIT!      *)
(************************************************)
(* Generated by: ocaml-protoc-plugin            *)
(* https://github.com/issuu/ocaml-protoc-plugin *)
(************************************************)
(*
  Source: code.proto
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
module Google = struct
  module Rpc = struct
    module rec Code : sig
      type t = OK | CANCELLED | UNKNOWN | INVALID_ARGUMENT | DEADLINE_EXCEEDED | NOT_FOUND | ALREADY_EXISTS | PERMISSION_DENIED | UNAUTHENTICATED | RESOURCE_EXHAUSTED | FAILED_PRECONDITION | ABORTED | OUT_OF_RANGE | UNIMPLEMENTED | INTERNAL | UNAVAILABLE | DATA_LOSS 
      val to_int: t -> int
      val from_int: int -> (t, [> Runtime'.Result.error]) result
    end = struct 
      type t = OK | CANCELLED | UNKNOWN | INVALID_ARGUMENT | DEADLINE_EXCEEDED | NOT_FOUND | ALREADY_EXISTS | PERMISSION_DENIED | UNAUTHENTICATED | RESOURCE_EXHAUSTED | FAILED_PRECONDITION | ABORTED | OUT_OF_RANGE | UNIMPLEMENTED | INTERNAL | UNAVAILABLE | DATA_LOSS 
      let to_int = function
        | OK -> 0
        | CANCELLED -> 1
        | UNKNOWN -> 2
        | INVALID_ARGUMENT -> 3
        | DEADLINE_EXCEEDED -> 4
        | NOT_FOUND -> 5
        | ALREADY_EXISTS -> 6
        | PERMISSION_DENIED -> 7
        | UNAUTHENTICATED -> 16
        | RESOURCE_EXHAUSTED -> 8
        | FAILED_PRECONDITION -> 9
        | ABORTED -> 10
        | OUT_OF_RANGE -> 11
        | UNIMPLEMENTED -> 12
        | INTERNAL -> 13
        | UNAVAILABLE -> 14
        | DATA_LOSS -> 15
      
      let from_int = function
        | 0 -> Ok OK
        | 1 -> Ok CANCELLED
        | 2 -> Ok UNKNOWN
        | 3 -> Ok INVALID_ARGUMENT
        | 4 -> Ok DEADLINE_EXCEEDED
        | 5 -> Ok NOT_FOUND
        | 6 -> Ok ALREADY_EXISTS
        | 7 -> Ok PERMISSION_DENIED
        | 16 -> Ok UNAUTHENTICATED
        | 8 -> Ok RESOURCE_EXHAUSTED
        | 9 -> Ok FAILED_PRECONDITION
        | 10 -> Ok ABORTED
        | 11 -> Ok OUT_OF_RANGE
        | 12 -> Ok UNIMPLEMENTED
        | 13 -> Ok INTERNAL
        | 14 -> Ok UNAVAILABLE
        | 15 -> Ok DATA_LOSS
        | n -> Error (`Unknown_enum_value n)
      
    end
  end
end