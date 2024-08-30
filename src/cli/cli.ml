open Cmdliner
open Config

(* Function to parse and validate the config *)
let parse_and_validate time_limit target_concentration input_spaces =
  let config : Config.config = { time_limit; target_concentration; input_spaces } in
  Validate.validate_config config
;;

(* Function to handle the parsed command-line arguments and execute the program *)
let run time_limit target_concentration input_spaces =
  match parse_and_validate time_limit target_concentration input_spaces with
  | Ok checked_config ->
    Printf.printf
      "Running fluido-cli with time_limit=%d, target_concentration=%f\n"
      checked_config.time_limit
      checked_config.target_concentration;
    List.iter
      (fun (fluid, (concentration, volume)) ->
        Printf.printf
          "Input space: fluid=%s, concentration=%f, volume=%f\n"
          fluid
          concentration
          volume)
      checked_config.input_spaces
  | Error msg ->
    Printf.eprintf "Error: %s\n" msg;
    exit 1
;;

(* Command handler using the run function *)
let term =
  Term.(
    const run
    $ Config.time_limit_arg
    $ Config.target_concentration_arg
    $ Config.input_space_arg)
;;

(* Command info *)
let info =
  let doc = "Fluido-cli for simulating fluid mixing experiments." in
  let man =
    [ `S Cmdliner.Manpage.s_bugs
    ; `P "You can report bugs at https://github.com/kayagokalp/fluidoml/issues."
    ]
  in
  Cmd.info "fluido-cli" ~version:"0.0" ~doc ~exits:Cmdliner.Cmd.Exit.defaults ~man
;;

let cmd = Cmd.v info term

(* Function to evaluate the command *)
let run_cli () = exit (Cmdliner.Cmd.eval cmd)
