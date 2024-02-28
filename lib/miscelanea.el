
(defun find-first-unicode-char ()
  (interactive)
  (while (and (not (eobp))
              (eq 'ascii (char-charset (following-char))))
    (forward-char 1)))
