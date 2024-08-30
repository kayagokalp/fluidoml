(** Entry point for the fluidoml CLI *)

open Cmdliner
open Config
open Validate

(* Function to handle the parsed command-line arguments *)
let run time_limit target_concentration input_spaces =
  let config : Config.config = { time_limit; target_concentration; input_spaces } in
  match validate_config config with
  | Ok checked_config ->
    Printf.printf
      "Running fluidoml-cli with time_limit=%d, target_concentration=%f\n"
      checked_config.time_limit
      checked_config.target_concentration;
    List.iter
      (fun (fluid, (concentration, volume)) ->
        Printf.printf
          "Input space: fluid=%s, concentration=%f, volume=%f\n"
          fluid
          concentration
          volume)
      checked_config.input_spaces;
    ()
  | Error msg ->
    Printf.eprintf "Error: %s\n" msg;
    exit 1
;;

(* Command handler *)
let term = Term.(const run $ time_limit_arg $ target_concentration_arg $ input_space_arg)

(* Command info *)
let info =
  let doc = "Fluidoml-cli for simulating fluid mixing experiments." in
  let man =
    [ `S Manpage.s_bugs
    ; `P "You can report bugs at https://github.com/kayagokalp/fluidoml/issues."
    ]
  in
  Cmd.info "fluidoml-cli" ~version:"1.0" ~doc ~exits:Cmd.Exit.defaults ~man
;;

(* Combine term and info into a single command *)
let cmd = Cmd.v info term

(* Function to evaluate the command *)
let run_cli () = exit (Cmd.eval cmd)
