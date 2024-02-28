
(with-eval-after-load 'info
  (info-initialize)
  (s! Info-default-directory-list
      '("/usr/local/share/info/"
        "/usr/share/info/"
        "/usr/local/share/info/" ))
  (s! Info-directory-list
      `( ,(concat source-directory "/info")
         "./"
         ,@Info-default-directory-list)))

;;; assign bindings for mouse's left and right clicks
(local-set-key [drag-mouse-8] 'Info-history-back)
(local-set-key [drag-mouse-9] 'Info-history-forward)
(local-set-key [mouse-8] 'Info-history-back)
(local-set-key [mouse-9] 'Info-history-forward)

(load-theme 'info)

;;; disable mode line
(set-or-toggle-mode-line nil)

(add-hook 'Info-selection-hook
          (lambda ()
            (message "%s:%s" Info-current-file Info-current-node)
            (let* ((file (file-name-nondirectory Info-current-file))
                   (node Info-current-node)
                   (name
                    (if (equal "dir" file)
                        "INFO:DIR"
                      (if (equal "Top" node)
                          (format "i:%s" file)
                        (format "{%s}" node)))))
              (rename-buffer name t))))




