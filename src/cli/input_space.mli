(** Module for handling input spaces in fluido-cli *)

(** Type representing an input space *)
type t = string * (float * float)

val parse : string -> (t, [ `Msg of string ]) result
val to_string : Format.formatter -> t -> unit
