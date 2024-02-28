
(which-function-mode 1)

(and (is-x?) (hl-line-mode))

(load-config 'paren-match)

;;; disable mode line
(set-or-toggle-mode-line nil)

;; (tab-bar-mode -1)
(tab-line-mode -1)

;;; COLOR THEME
(load-theme 'inferior-scheme)

(load-config 'inferior-scheme)

