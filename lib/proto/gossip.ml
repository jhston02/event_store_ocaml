(************************************************)
(*       AUTOGENERATED FILE - DO NOT EDIT!      *)
(************************************************)
(* Generated by: ocaml-protoc-plugin            *)
(* https://github.com/issuu/ocaml-protoc-plugin *)
(************************************************)
(*
  Source: gossip.proto
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
  module Shared = Shared
end
(**/**)
module Event_store = struct
  module Client = struct
    module Gossip = struct
      module rec ClusterInfo : sig
        val name': unit -> string
        type t = MemberInfo.t list 
        val make : ?members:MemberInfo.t list -> unit -> t
        val to_proto: t -> Runtime'.Writer.t
        val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
      end = struct 
        let name' () = "gossip.event_store.client.gossip.ClusterInfo"
        type t = MemberInfo.t list
        let make =
          fun ?members () -> 
          let members = match members with Some v -> v | None -> [] in
          members
        
        let to_proto =
          let apply = fun ~f:f' members -> f' [] members in
          let spec = Runtime'.Serialize.C.( repeated (1, (message (fun t -> MemberInfo.to_proto t)), not_packed) ^:: nil ) in
          let serialize = Runtime'.Serialize.serialize [] (spec) in
          fun t -> apply ~f:serialize t
        
        let from_proto =
          let constructor = fun _extensions members -> members in
          let spec = Runtime'.Deserialize.C.( repeated (1, (message (fun t -> MemberInfo.from_proto t)), not_packed) ^:: nil ) in
          let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
          fun writer -> deserialize writer |> Runtime'.Result.open_error
        
      end
      and EndPoint : sig
        val name': unit -> string
        type t = { address: string; port: int } 
        val make : ?address:string -> ?port:int -> unit -> t
        val to_proto: t -> Runtime'.Writer.t
        val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
      end = struct 
        let name' () = "gossip.event_store.client.gossip.EndPoint"
        type t = { address: string; port: int }
        let make =
          fun ?address ?port () -> 
          let address = match address with Some v -> v | None -> {||} in
          let port = match port with Some v -> v | None -> 0 in
          { address; port }
        
        let to_proto =
          let apply = fun ~f:f' { address; port } -> f' [] address port in
          let spec = Runtime'.Serialize.C.( basic (1, string, proto3) ^:: basic (2, uint32_int, proto3) ^:: nil ) in
          let serialize = Runtime'.Serialize.serialize [] (spec) in
          fun t -> apply ~f:serialize t
        
        let from_proto =
          let constructor = fun _extensions address port -> { address; port } in
          let spec = Runtime'.Deserialize.C.( basic (1, string, proto3) ^:: basic (2, uint32_int, proto3) ^:: nil ) in
          let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
          fun writer -> deserialize writer |> Runtime'.Result.open_error
        
      end
      and MemberInfo : sig
        module rec VNodeState : sig
          type t = Initializing | DiscoverLeader | Unknown | PreReplica | CatchingUp | Clone | Follower | PreLeader | Leader | Manager | ShuttingDown | Shutdown | ReadOnlyLeaderless | PreReadOnlyReplica | ReadOnlyReplica | ResigningLeader 
          val to_int: t -> int
          val from_int: int -> (t, [> Runtime'.Result.error]) result
        end
        val name': unit -> string
        type t = { instance_id: Imported'modules.Shared.Event_store.Client.UUID.t option; time_stamp: int; state: MemberInfo.VNodeState.t; is_alive: bool; http_end_point: EndPoint.t option } 
        val make : ?instance_id:Imported'modules.Shared.Event_store.Client.UUID.t -> ?time_stamp:int -> ?state:MemberInfo.VNodeState.t -> ?is_alive:bool -> ?http_end_point:EndPoint.t -> unit -> t
        val to_proto: t -> Runtime'.Writer.t
        val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
      end = struct 
        module rec VNodeState : sig
          type t = Initializing | DiscoverLeader | Unknown | PreReplica | CatchingUp | Clone | Follower | PreLeader | Leader | Manager | ShuttingDown | Shutdown | ReadOnlyLeaderless | PreReadOnlyReplica | ReadOnlyReplica | ResigningLeader 
          val to_int: t -> int
          val from_int: int -> (t, [> Runtime'.Result.error]) result
        end = struct 
          type t = Initializing | DiscoverLeader | Unknown | PreReplica | CatchingUp | Clone | Follower | PreLeader | Leader | Manager | ShuttingDown | Shutdown | ReadOnlyLeaderless | PreReadOnlyReplica | ReadOnlyReplica | ResigningLeader 
          let to_int = function
            | Initializing -> 0
            | DiscoverLeader -> 1
            | Unknown -> 2
            | PreReplica -> 3
            | CatchingUp -> 4
            | Clone -> 5
            | Follower -> 6
            | PreLeader -> 7
            | Leader -> 8
            | Manager -> 9
            | ShuttingDown -> 10
            | Shutdown -> 11
            | ReadOnlyLeaderless -> 12
            | PreReadOnlyReplica -> 13
            | ReadOnlyReplica -> 14
            | ResigningLeader -> 15
          
          let from_int = function
            | 0 -> Ok Initializing
            | 1 -> Ok DiscoverLeader
            | 2 -> Ok Unknown
            | 3 -> Ok PreReplica
            | 4 -> Ok CatchingUp
            | 5 -> Ok Clone
            | 6 -> Ok Follower
            | 7 -> Ok PreLeader
            | 8 -> Ok Leader
            | 9 -> Ok Manager
            | 10 -> Ok ShuttingDown
            | 11 -> Ok Shutdown
            | 12 -> Ok ReadOnlyLeaderless
            | 13 -> Ok PreReadOnlyReplica
            | 14 -> Ok ReadOnlyReplica
            | 15 -> Ok ResigningLeader
            | n -> Error (`Unknown_enum_value n)
          
        end
        let name' () = "gossip.event_store.client.gossip.MemberInfo"
        type t = { instance_id: Imported'modules.Shared.Event_store.Client.UUID.t option; time_stamp: int; state: MemberInfo.VNodeState.t; is_alive: bool; http_end_point: EndPoint.t option }
        let make =
          fun ?instance_id ?time_stamp ?state ?is_alive ?http_end_point () -> 
          let time_stamp = match time_stamp with Some v -> v | None -> 0 in
          let state = match state with Some v -> v | None -> (MemberInfo.VNodeState.from_int 0 |> Runtime'.Result.get ~msg:"Code gen error") in
          let is_alive = match is_alive with Some v -> v | None -> false in
          { instance_id; time_stamp; state; is_alive; http_end_point }
        
        let to_proto =
          let apply = fun ~f:f' { instance_id; time_stamp; state; is_alive; http_end_point } -> f' [] instance_id time_stamp state is_alive http_end_point in
          let spec = Runtime'.Serialize.C.( basic_opt (1, (message (fun t -> Imported'modules.Shared.Event_store.Client.UUID.to_proto t))) ^:: basic (2, int64_int, proto3) ^:: basic (3, (enum MemberInfo.VNodeState.to_int), proto3) ^:: basic (4, bool, proto3) ^:: basic_opt (5, (message (fun t -> EndPoint.to_proto t))) ^:: nil ) in
          let serialize = Runtime'.Serialize.serialize [] (spec) in
          fun t -> apply ~f:serialize t
        
        let from_proto =
          let constructor = fun _extensions instance_id time_stamp state is_alive http_end_point -> { instance_id; time_stamp; state; is_alive; http_end_point } in
          let spec = Runtime'.Deserialize.C.( basic_opt (1, (message (fun t -> Imported'modules.Shared.Event_store.Client.UUID.from_proto t))) ^:: basic (2, int64_int, proto3) ^:: basic (3, (enum MemberInfo.VNodeState.from_int), proto3) ^:: basic (4, bool, proto3) ^:: basic_opt (5, (message (fun t -> EndPoint.from_proto t))) ^:: nil ) in
          let deserialize = Runtime'.Deserialize.deserialize [] spec constructor in
          fun writer -> deserialize writer |> Runtime'.Result.open_error
        
      end
      module Gossip = struct
        module Read = struct
          let package_name = Some "event_store.client.gossip"
          let service_name = "Gossip"
          let method_name = "Read"
          let name = "/event_store.client.gossip.Gossip/Read"
          module Request = Imported'modules.Shared.Event_store.Client.Empty
          module Response = ClusterInfo
        end
        let read = 
          (module Imported'modules.Shared.Event_store.Client.Empty : Runtime'.Service.Message with type t = Imported'modules.Shared.Event_store.Client.Empty.t ), 
          (module ClusterInfo : Runtime'.Service.Message with type t = ClusterInfo.t )
        
      end
    end
  end
end