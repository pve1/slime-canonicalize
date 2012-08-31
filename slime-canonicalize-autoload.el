
;;;; Load this to make it available upon slime-connect.

(setq slime-canonicalize-location
      (file-name-directory (file-truename load-file-name)))

(load (concat slime-canonicalize-location
              "slime-canonicalize.el"))

(defun slime-load-slime-canonicalize ()
  (slime-eval `(cl:progn
                (cl:load ,(concat slime-canonicalize-location
                                  "slime-canonicalize.asd"))
                (cl:require :slime-canonicalize))))


(add-hook 'slime-connected-hook 'slime-load-slime-canonicalize)

(provide 'slime-canonicalize-autoload)


