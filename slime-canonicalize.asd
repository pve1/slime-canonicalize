(asdf:defsystem #:slime-canonicalize
  :version "0.1"
  :author "Peter von Etter"
  :description "Slime-canonicalize inserts package prefixes into lisp code."
  :license "LLGPL"
  :serial t
  :depends-on (:cl-ppcre)
  :components ((:file "package")
               (:file "slime-canonicalize")))
