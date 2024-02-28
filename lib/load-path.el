

(defun add-directory-to-load-path (dir)
  (add-to-list 'load-path
               (directory-file-name
                (file-name-directory dir))))

