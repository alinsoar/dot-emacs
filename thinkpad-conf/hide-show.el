
(s! hs-hide-comments-when-hiding-all t)
(s! hs-isearch-open 'code)	; code comment t nil

(define-key hs-minor-mode-map [tab] 'tab-hs-hide ) ; (kbd "TAB")
(define-key hs-minor-mode-map (kbd "C-)") 'hs-hide-block)
(define-key hs-minor-mode-map (kbd "C-(") 'hs-show-block)

(define-key hs-minor-mode-map
  [(control ?c) ?\(]
  (lambda (&optional arg)
    "With no arguments, unhides everything starting from the
     upper level down. With an argument N, unhides N levels,
     inside the current block."
    (interactive "P")
    (if (null arg)
	(hs-show-all)
      (hs-show-block arg) ) ) )

(define-key hs-minor-mode-map
  [(control ?c) ?\)]
  (lambda (&optional arg)
    "With no arguments, hides everything starting from the upper
     level down. With an argument N, hides Nth level, starting
     from the point"
    (interactive "P")
    (if (null arg)
	(hs-hide-all)
      (hs-hide-level arg) ) ) )

(local-set-key [(control escape)] 'hs-show-all)
(local-set-key [(meta f1)] (lambda () (interactive) (hs-show-all)))

(local-set-key [(control f1)] (lambda () (interactive) (hs-hide-level 1)))
(local-set-key [(control f2)] (lambda () (interactive) (hs-hide-level 2)))
(local-set-key [(control f3)] (lambda () (interactive) (hs-hide-level 3)))

(local-set-key [(control f5)]     'hs-hide-all)




