(lang dune 3.12)

(name fluidoml)

(generate_opam_files true)

(source
 (github kayagokalp/fluidoml))

(authors "kayagokalp")

(maintainers "kayagokalp")

(license MIT)

(documentation https://github.com/kayagokalp/fluidoml/docs)

(package
 (name fluidoml)
 (synopsis "A mixing experiment with e-graphs")
 (description "Using egraphs and saturation to find mixing sequences for given target")
 (depends ocaml dune)
 (tags
  (topics "egraphs" "microfluidics")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
