
(and
 (load-theme-config-file-p)
 (load-theme 'minibuffer) )


;; save history
(provide 'savehist)
(savehist-mode)

(add-hook 'minibuffer-exit-hook 'minibuffer-exit)

(defun minibuffer-exit ()
  (load-config 'minibuffer-exit))

