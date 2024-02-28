
;;; jump to the beginning/end of the function and line
(defun -home ()
  (interactive)
  (if (eq (point) (point-at-bol) )
      (beginning-of-defun)
    (beginning-of-line) ) )
(defun -end ()
  (interactive)
  (if (eq (point) (point-at-eol) )
      (end-of-defun)
    (end-of-line) ) )

