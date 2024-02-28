

(defun pwd-path ()
  (substring
   default-directory
   (or (string-match "/[^/]+/[^/]+/$" default-directory)
       0 ) ) )

;; MODE-LINE
(s!
 mode-line-format
 (list
  '(line-number-mode "%l:")
  '(column-number-mode "%c %% ")
  '(-10 "%p %% ")
  '(:propertize "%b %% " face mode-line-buffer-id)
  '(:propertize (:eval (if (> (length default-directory)
                              (length (pwd-path) ) )
                           "..."
                         ""))
                face mode-line)
  '(:propertize (:eval (pwd-path))
                face mode-line)
  " %% %[("
  '(:propertize "%s" face mode-line)
  "%n"
  ")%]%-"
  ))

(defun comint-fix-window-size ()
  "Change process window size."
  (when (derived-mode-p 'comint-mode)
    (let ((process (get-buffer-process (current-buffer))))
      (and
       process
       (set-process-window-size process
				(window-height)
				(window-width))))))

(add-hook 'window-configuration-change-hook 'comint-fix-window-size nil t)

(load-theme 'shell)

;;; disable mode line
(set-or-toggle-mode-line nil)

