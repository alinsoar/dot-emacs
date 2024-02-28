
(define-key bookmark-bmenu-mode-map
            [(control ?x) (control ?s)] 'bookmark-save)

(define-key (current-local-map) "q" 'quit-window-kill-buffer)


(setq set-bookmark-timer
      (run-with-idle-timer 0 nil
                           (lambda ()
                             "setup after loading is complete"
                             (bookmark-bmenu-hide-filenames)
                             (s! show-trailing-whitespace nil)
                             (and (timerp set-bookmark-timer)
                                  (cancel-timer set-bookmark-timer)))))

