

(load-config 'backup)

(and (is-x?)
     (hl-line-mode))

;;; in makefile we use tabs instead of spaces
(setq indent-tabs-mode t)

(load-theme 'makefile)


;;; disable mode line
(set-or-toggle-mode-line nil)

