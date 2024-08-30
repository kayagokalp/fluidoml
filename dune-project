(lang dune 3.0)

(name fluidoml)
(generate_opam_files true)
(license MIT)
(source (github kayagokalp/fluidoml))

(package
 (name fluidoml)
 (synopsis "Fluidoml core package")
 (description "A project for simulating fluid mixing experiments, including a command-line interface.")
 (depends cmdliner))

