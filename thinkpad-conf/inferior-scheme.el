

;;; ask for scheme's working directory
(and (yes-or-no-p "start scheme in an empty frame")
     (make-frame-command))

(let ((where (read-file-name
              "Scheme working directory"
              (file-name-directory
               (or buffer-file-name default-directory "~"))))
      (proc (scheme-get-process)))
  (process-send-string
   proc
   (format "(set-working-directory-pathname! \"%s\")\n" where))
  (tab-bar-rename-tab "REPL/SCHEME")
  )

