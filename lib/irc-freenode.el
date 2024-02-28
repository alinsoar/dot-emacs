
(defun freenode (&optional l)
  "connect on freenode"
  (interactive)

  (let* ((acc (with-temp-buffer
               (insert-file-contents (concat CONFIG-ROOT-DIR
                                             thinkpad-config-directory
                                             "/.erc-login"))
               (split-string (buffer-string))))
         (erc-nick (car acc))
         (erc-password (cadr acc)))
    (erc :server (erc-compute-server)
         :port   (erc-compute-port)
         :nick   (erc-compute-nick)
         )))

