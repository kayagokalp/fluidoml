(lang dune 3.0)

(name fluido)
(generate_opam_files true)
(license MIT)
(source (github kayagokalp/fluidoml))

(package
 (name fluido)
 (synopsis "Fluido core package")
 (description "A project for simulating fluid mixing experiments, including a command-line interface.")
 (depends cmdliner alcotest))

