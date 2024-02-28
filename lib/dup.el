
(defun dup-current-line ()
  "duplicate the current line"
  (interactive)
  (barf-if-buffer-read-only)
  (let ((line (buffer-substring-no-properties
               (line-beginning-position) (line-end-position)))
        (col (current-column)))
    (forward-line 1)
    (open-line 1)
    (insert line)
    (move-to-column col)))

(defun dup-sexp (&optional arg)
  "with argument, duplicate the expression at upper
list. otherwise, duplicate the expression following the pointer."
  (interactive "P")
  (barf-if-buffer-read-only)
  (and arg (backward-up-list 1))
  (insert-buffer-substring (current-buffer)
                           (point)
                           (save-excursion (forward-sexp 1) (point)))
  (newline))

