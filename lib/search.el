
(defun isearch-and-edit ()
  (interactive)
  (isearch-forward nil t)
  (cond ((use-region-p)
         (isearch-yank-string
          (buffer-substring-no-properties
           (region-beginning)
           (region-end)))
         (deactivate-mark))
        ;; symbol list SEXP defun filename url email uuid word
        ;; sentence whitespace line page
        ((bounds-of-thing-at-point 'sexp)
         (isearch-yank-string
          (format "%s" (sexp-at-point)))))
  (isearch-edit-string))
