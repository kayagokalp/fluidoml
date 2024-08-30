(** Module for handling input spaces in fluido-cli *)

(** Type representing an input space *)
type t = string * (float * float)

(** Validate that a float is between 0.0 and 1.0 *)
let validate_float_between_0_and_1 f =
  if f < 0.0 || f > 1.0 then Error (`Msg "Value must be between 0.0 and 1.0") else Ok f
;;

(** Parse an input space from a string *)
let parse str =
  try
    Scanf.sscanf str "(%[^,],%f,%f)" (fun fluid concentration volume ->
      match
        ( validate_float_between_0_and_1 concentration
        , validate_float_between_0_and_1 volume )
      with
      | Ok concentration, Ok volume -> Ok (fluid, (concentration, volume))
      | Error e, _ | _, Error e -> Error e)
  with
  | Scanf.Scan_failure _ | End_of_file ->
    Error (`Msg "Invalid input-space format. Expected format: (fluid_name,float,float)")
;;

(** Convert an input space to a string *)
let to_string fmt (fluid, (concentration, volume)) =
  Format.fprintf fmt "(%s,%f,%f)" fluid concentration volume
;;
