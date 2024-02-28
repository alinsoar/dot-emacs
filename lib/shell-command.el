
(defun repeat-shell-command (&optional arg)
  (interactive "P")
  (and (or arg
           (not (boundp 'current-compile-command)))
       (s! current-compile-command
           (read-shell-command "command > ")))
  (shell-command current-compile-command))
