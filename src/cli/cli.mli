(** Entry point for the fluidoml CLI *)

val parse_and_validate
  :  int
  -> float
  -> Input_space.t list
  -> (Config.checked_config, string) result

val run_cli : unit -> unit

(* Expose the cmd value *)
val cmd : unit Cmdliner.Cmd.t
