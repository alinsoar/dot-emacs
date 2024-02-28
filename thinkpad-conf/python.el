
;;; TODO

;; (setq
;;  python-shell-interpreter "ipython"
;;  python-shell-interpreter-args ""
;;  python-shell-prompt-regexp "-- "
;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;  python-shell-completion-setup-code
;;  "from IPython.core.completerlib import module_completion"
;;  python-shell-completion-module-string-code
;;  "';'.join(module_completion('''%s'''))\n"
;;  python-shell-completion-string-code
;;  "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(setq
 ;; python-shell-interpreter "ipython"
 python-shell-interpreter "python"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "-- "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 ;; python-shell-completion-setup-code
 ;; "from IPython.core.completerlib import module_completion"
 ;; python-shell-completion-module-string-code
 ;; "';'.join(module_completion('''%s'''))\n"
 ;; python-shell-completion-string-code
 ;; "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
 )

(define-key python-mode-map (kbd "M-)")
  (lambda () (interactive)))

(local-set-key
 [f9]
 (lambda ()
   (interactive)
   (cond
    ((not (python-shell-get-buffer))
     (message "python is not running"))
    ((with-current-buffer
	 (python-shell-get-buffer)
       (funcall (local-key-binding [f12])))
     (comint-send-string (python-shell-get-process) "\n")
     (save-excursion
       (python-shell-send-buffer)))
    (t
     "comint prints an error"
     nil))))

(local-set-key
 [f12]
 (lambda ()
   (interactive)
   (cond
    ((not (python-shell-get-buffer))
     (message "python is not running"))
    (t
     (with-current-buffer
	 (python-shell-get-buffer)
       (and
	(funcall (local-key-binding [f12]))
	(comint-send-string (python-shell-get-process) "\"clear\"\n")))))))

(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init))

  (flymake-mode)

  (flyspell-prog-mode))

(keymap-unset python-mode-map "<backtab>" t)
