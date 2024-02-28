
(load-config 'backup)

(which-function-mode 1)

(hs-minor-mode)

(display-line-numbers-mode nil)

(and (is-x?) (hl-line-mode))

(load-config 'paren-match)

(load-config 'imenu)

(load-config 'lisp)

(load-config 'scheme)

(load-external 'paredit)
(paredit-mode)

;; (ruler-mode)

;;; Interaction with the scheme process
;; (require 'xscheme)

;;; COLOR THEME
(load-theme 'lisp)

;;; disable mode line
(set-or-toggle-mode-line nil)

