
(load-config 'backup)

(which-function-mode 1)

(hs-minor-mode)

(display-line-numbers-mode nil)

(and (is-x?)
     (hl-line-mode))

(load-config 'paren-match)

(load-config 'imenu)

(load-config 'lisp)

(load-config 'paren-match)

(load-external 'paredit)
(paredit-mode)

;;; (ruler-mode)

(frame:set-cursor-color "blue")
(frame:set-cursor-type '(bar . 4) '(hbar . 3))
(frame:set-cursor-no-blink)


;;; PRETTY LAMBDA
(make-pretty '(("lambda" . 955) ))


;;; COLOR THEME
(load-theme 'lisp)

;;; disable mode line
(set-or-toggle-mode-line nil)

