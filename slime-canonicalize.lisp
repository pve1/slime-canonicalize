;; This software is Copyright (c) Peter von Etter, 2012.
;; You can distribute and use it as governed by the terms of the Lisp
;; Lesser GNU Public License
;; (http://opensource.franz.com/preamble.html), known as the LLGPL.

(in-package #:slime-canonicalize)

(defun canonicalize-symbol-string (symbol-string target-package)
  (let* ((pkg (find-package (string-upcase target-package)))
         (parsed-symbol-name symbol-string)
         (parsed-symbol-package)
         (upcased))

    (cl-ppcre:register-groups-bind (package symbol)
        ("([^:]+?)::?(.+)" symbol-string)
      (setf parsed-symbol-name symbol)
      (setf parsed-symbol-package package))

    (setf upcased (string-upcase (or parsed-symbol-name
                                     symbol-string)))

    (when (and pkg (not (equalp target-package
                                parsed-symbol-package)))
      (multiple-value-bind (sym status)
          (find-symbol upcased pkg)
        (when (and sym
                   (not (eq status :inherited))
                   ;; Symbol is interesting
                   (or (fboundp sym)
                       (boundp sym)
                       (find-class sym nil)
                       (eq status :external)))

          ;; Canonical form as a string
          (concatenate 'string
                       target-package
                       (case status
                         (:internal "::")
                         (:external ":"))
                       parsed-symbol-name))))))
