
(load-config 'comint)

(frame:set-cursor-color "red")
(frame:set-cursor-type '(bar . 1) '(hbar . 1))
(frame:set-cursor-no-blink)



(add-hook 'comint-exec-hook 
          (lambda () (set-process-query-on-exit-flag
                 (get-buffer-process (current-buffer))
                 nil)))


