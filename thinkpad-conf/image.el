


(define-key image-mode-map "q" 'quit-window-kill-buffer)
;; Browse prev/next images according to their order in Dired
(define-key image-mode-map [(left)] 'image-previous-file)
(define-key image-mode-map [(right)] 'image-next-file)
(define-key image-mode-map [(control left)] 'image-backward-hscroll)
(define-key image-mode-map [(control right)] 'image-forward-hscroll)

