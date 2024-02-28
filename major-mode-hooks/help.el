

;;; SHORTCUTS FOR BACK AND FORWARD ACTIONS
(define-key help-mode-map [drag-mouse-8] 'help-go-back)
(define-key help-mode-map [drag-mouse-9] 'help-go-forward)
(define-key help-mode-map [mouse-8] 'help-go-back)
(define-key help-mode-map [mouse-9] 'help-go-forward)
(define-key help-mode-map "b" 'help-go-back )
(define-key help-mode-map "f" 'help-go-forward )

;; THEME
(load-theme 'help)

;; ;; CURSOR
;; (load-config 'cursor 'conf)



;;; disable mode line
(set-or-toggle-mode-line nil)

