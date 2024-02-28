
;;; MUST load themes before config, as the theme defines some faces
;;; required by config
(load-theme 'dired)

(load-config 'dired)

(frame:set-cursor-color "black")
(frame:set-cursor-type '(bar . 4) '(hbar . 4))
(frame:set-cursor-no-blink)

;;; load config/dired before
(load "dired-x")
(dired-omit-mode 1)


;;; disable mode line
(set-or-toggle-mode-line nil)

