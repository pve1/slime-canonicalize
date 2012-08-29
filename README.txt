
Slime-canonicalize inserts package prefixes into lisp code.  It can be
useful when splitting big packages into smaller ones.

Example usage:


----myfile.lisp------

(in-package :my-package)

(defun foo ()
  (mappend (lambda (x) (list x x)) (iota 10)))

--end myfile.lisp----


M-x slime-query-canonicalize-symbols
Target package: alexandria RET


----myfile.lisp------

(in-package :my-package)

(defun foo ()
  (alexandria:mappend (lambda (x) (list x x)) (alexandria:iota 10)))

--end myfile.lisp----


M-x slime-query-canonicalize-symbols
Target package: cl RET


----myfile.lisp------

(cl:in-package :my-package)

(cl:defun foo ()
  (alexandria:mappend (cl:lambda (x) (cl:list x x)) (alexandria:iota 10)))

--end myfile.lisp----
