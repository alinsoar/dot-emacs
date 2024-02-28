
;; command line interpreter

(local-set-key
 [f12]
 (lambda ()
   "
    ;; this is a generic function that clears the comint buffer, and can
    ;; be called from all major modes derived from comint-mode and from
    ;; command interpreter buffer itself.
   "
   (interactive)
   (if (get-buffer-process (current-buffer))
       (prog1 t
	 (erase-buffer)
	 (comint-kill-input))
     (message "*interpreter process does not run*")
     nil)))

(local-set-key
 [(control pause)]
 (lambda ()
   " Useful for breaking a running process "
   (interactive)
   (if (get-buffer-process (current-buffer))
       (prog1 t
	 (comint-interrupt-subjob))
     (prog1 nil
       (message "*interpreter process does not run*")))))

(define-key comint-mode-map (kbd "C-c l") 'comint-dynamic-list-input-ring)

