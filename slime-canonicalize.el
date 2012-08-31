
(defun slime-canonicalize-symbol (symbol package)
  (slime-eval `(slime-canonicalize::canonicalize-symbol-string
                ,symbol
                ,package)))

(defun slime-query-canonicalize-symbols (package)
  (interactive "sTarget package: ")

  (when (region-active-p)
    (unless (< (point) (mark))
      (exchange-point-and-mark)))

  (loop for matched = (search-forward-regexp
                       "[-+*/@$%^&_=<>~.!?[:word:]:]+"
                       (if (region-active-p)
                           (region-end)
                         nil)
                       t)
        while matched
        do
        (let* ((data (match-data))
               (symbol (match-string-no-properties 0))
               (replacement (slime-canonicalize-symbol symbol package)))
          (when replacement
            (when (y-or-n-p (format "Replace %s with %s? " symbol replacement))
              (set-match-data data)
              (replace-match replacement t t)))))
  (message "Done."))

(provide 'slime-canonicalize)
