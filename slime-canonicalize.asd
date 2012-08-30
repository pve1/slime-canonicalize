
(asdf:defsystem #:slime-canonicalize
  :serial t
  :depends-on (:cl-ppcre)
  :components ((:file "package")
               (:file "slime-canonicalize")))


