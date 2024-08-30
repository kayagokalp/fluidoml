(* Function to create an e-graph, add an expression, and convert it to Graphviz *)
let create_egraph_with_expr () =
  (* Initialize an e-graph *)
  let graph = Ego.Basic.EGraph.init () in
  (* Manually construct the S-expression equivalent *)
  let expr =
    let open Sexplib0.Sexp in
    List [ Atom "/"; List [ Atom "<<"; Atom "a"; Atom "1" ]; Atom "2" ]
  in
  (* Add the expression to the e-graph *)
  let _ = Ego.Basic.EGraph.add_sexp graph expr in
  (* Convert the e-graph to Graphviz format *)
  let g : Odot.graph = Ego.Basic.EGraph.to_dot graph in
  g
;;

let test_egraph graph =
  let a = Odot.string_of_graph graph in
  a
;;

let () =
  let graph = create_egraph_with_expr () in
  let graph_str = test_egraph graph in
  print_endline graph_str
;;
