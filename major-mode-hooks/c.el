
;;; TODO

(hs-minor-mode)

(load-config 'backup)

(and (is-x?)
     (hl-line-mode))

(load-config 'imenu)

(load-config 'paren-match)

;; (load-config 'c-style)

(load-config 'c)

(display-line-numbers-mode nil)

(frame:set-cursor-color "blue")
(frame:set-cursor-type '(bar . 4) '(hbar . 3))
(frame:set-cursor-no-blink)

(message "todo: c mode is not yet fully confgured")

(load-theme 'c)


;;; disable mode line
(set-or-toggle-mode-line nil)

