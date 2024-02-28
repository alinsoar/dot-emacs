
;; (setq lisp-indent-offset 2
;;       lisp-body-indent 2)

(local-set-key [f12]
  (lambda ()
    (interactive)
    (require 'xscheme)
    (if (not (xscheme-process-running-p))
      (message "scheme is not running. do 'run-scheme` to start it")
      (with-current-buffer (xscheme-process-buffer)
        (erase-buffer)
        (insert "\n\n")
        (set-marker (process-mark (get-process xscheme-process-name))
          (point-max))
        (message "cleaned scheme buffer")) ) ) )


;;; Pretty keywords
(make-pretty '(("lambda" . 955)
               ("named-lambda" . 923)
               ("define" . 8801)
               ))

(frame:set-cursor-type '(bar . 4) '(hbar . 3))
(frame:set-cursor-no-blink)
(frame:set-cursor-color "red")

