open Alcotest

(* Test: Valid arguments should parse correctly *)
let test_valid_args () =
  match Cli.parse_and_validate 10 0.5 [ "water", (0.5, 0.5) ] with
  | Ok config ->
    check int "Time limit is 10" 10 config.time_limit;
    check (float 0.01) "Target concentration is 0.5" 0.5 config.target_concentration;
    check
      (list (pair string (pair (float 0.01) (float 0.01))))
      "Input space is parsed correctly"
      [ "water", (0.5, 0.5) ]
      config.input_spaces
  | Error _ -> fail "Expected valid config, but got an error"
;;

(* Test: Missing or invalid arguments should fail *)
let test_invalid_args () =
  let invalid_cases =
    [ None, Some 0.5, [ "water", (0.5, 0.5) ], "Missing time limit"
    ; Some 10, None, [ "water", (0.5, 0.5) ], "Missing target concentration"
    ; Some 10, Some 1.2, [ "water", (1.2, 0.5) ], "Invalid concentration in input space"
    ]
  in
  List.iter
    (fun (time_limit, target_concentration, input_spaces, error_msg) ->
      let result =
        match time_limit, target_concentration with
        | Some tl, Some tc -> Cli.parse_and_validate tl tc input_spaces
        | _ -> Error "Missing required arguments"
      in
      match result with
      | Ok _ -> fail ("Expected error: " ^ error_msg)
      | Error _ -> () (* Expected *))
    invalid_cases
;;

let () =
  run
    "CLI tests"
    [ "valid_args", [ test_case "Valid arguments" `Quick test_valid_args ]
    ; "invalid_args", [ test_case "Invalid arguments" `Quick test_invalid_args ]
    ]
;;
