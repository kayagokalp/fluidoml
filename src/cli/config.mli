(** Configurations for the fluido-cli *)

(** Type representing the raw user input configuration *)
type config =
  { time_limit : int
  ; target_concentration : float
  ; input_spaces : Input_space.t list
  }

(** Type representing the validated configuration *)
type checked_config =
  { time_limit : int
  ; target_concentration : float
  ; input_spaces : Input_space.t list
  }

val time_limit_arg : int Cmdliner.Term.t
val target_concentration_arg : float Cmdliner.Term.t
val input_space_arg : Input_space.t list Cmdliner.Term.t
