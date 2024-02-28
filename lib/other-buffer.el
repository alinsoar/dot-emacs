
;; sauter au prochain fichier ayant la même extension que le buffer courant

(defvar commute-list nil)

(defun filter-text-files (list)
  (let (result)
    (dolist (item list)
      (let ((mime (shell-command-to-string
                   (concat "file -i " item ) ) ) )
        (and (not (string-match "charset=binary" mime) )
             (setq result (cons item result) ) ) ) )
    result ) )

(defun commute-list-initialize ()
  (if (buffer-file-name)
      (let* ((cb (file-name-nondirectory (buffer-file-name) ) )
             (bfn (file-name-sans-extension cb) )
             (files
              (filter-text-files
               (directory-files "." nil
                                (concat "^" (regexp-quote bfn)
                                        "[.]"
                                        "\\(.*[^~]\\|\\)$" ) ) ) ) )
        (setq commute-list (sort files 'string<) ) ) ) )
(defun commute-buffer (&optional force)
  (interactive "P")
  (if (buffer-file-name)
      (let ((cb (file-name-nondirectory (buffer-file-name) ) ) )
        (progn
          ;; initialize in any of these cases
          (when (or force
                    (null commute-list)
                    (null (member cb commute-list ) ) )
            (commute-list-initialize) )
          (let ((items (remove (buffer-name) commute-list)))
           (cond
            ((null items )
             (message "there is no other file having the same base name.") )
            ((null (cdr items) )
             (find-file (car items) ) )
            (t
             (find-file (ido-completing-read ">" items) ) ) ) ) ) )
    (message "no file attached to the current buffer.") ) )

