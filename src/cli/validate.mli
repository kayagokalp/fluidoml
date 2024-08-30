(** Module for validating configurations in fluido-cli *)

open Config

val validate_config : config -> (checked_config, string) result
