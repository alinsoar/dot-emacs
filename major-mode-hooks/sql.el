
(load-config 'backup)

(hs-minor-mode)

(and (is-x?) (hl-line-mode))

(load-config 'sql)

;;; COLOR THEME
(load-theme 'sql)

;;; disable mode line
(set-or-toggle-mode-line nil)
