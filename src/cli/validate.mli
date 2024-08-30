(** Module for validating configurations in fluidoml-cli *)

open Config

val validate_config : config -> (checked_config, string) result
