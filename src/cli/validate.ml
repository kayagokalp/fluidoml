(** Module for validating configurations in fluido-cli *)

open Config

(** Validate the configuration and return a checked configuration *)
let validate_config (config : config) : (checked_config, string) result =
  if config.target_concentration < 0.0 || config.target_concentration > 1.0
  then Error "Target concentration must be between 0.0 and 1.0"
  else
    Ok
      { time_limit = config.time_limit
      ; target_concentration = config.target_concentration
      ; input_spaces = config.input_spaces
      }
;;
