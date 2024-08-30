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

(** Command-line argument parsing for time limit *)
let time_limit_arg =
  let doc = "Time limit for the simulation." in
  Cmdliner.Arg.(
    required & opt (some int) None & info [ "t"; "time-limit" ] ~docv:"TIME_LIMIT" ~doc)
;;

(** Command-line argument parsing for target concentration *)
let target_concentration_arg =
  let doc = "Target concentration, must be a float between 0.0 and 1.0." in
  Cmdliner.Arg.(
    required
    & opt (some float) None
    & info [ "c"; "target-concentration" ] ~docv:"TARGET_CONCENTRATION" ~doc)
;;

(** Command-line argument parsing for input spaces *)
let input_space_arg =
  let doc = "Input space in the form of (fluid_name,float,float)." in
  Cmdliner.Arg.(
    value
    & opt_all (Cmdliner.Arg.conv (Input_space.parse, Input_space.to_string)) []
    & info [ "i"; "input-space" ] ~docv:"INPUT_SPACE" ~doc)
;;
