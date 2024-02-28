
(require 'diff)

(s! backup-directory-alist
    (list (cons "."  (concat "./.backup/"
                             (format-time-string "%Y-%B-%d/")
                             (symbol-name major-mode)
                             "/"))))

(add-hook
 'before-save-hook
 (lambda ()
   ;;if the reference file does not exist any longer, recreate it.
   (and (boundp 'backup-buffer-reference-file)
        (not (file-exists-p backup-buffer-reference-file))
        (progn
         (makunbound 'backup-buffer-reference-file)
         (setq buffer-backed-up nil) ) ) )
 0
 'local)

(add-hook
 'after-save-hook
 (lambda nil
   (let ((diff-bk-file (make-backup-file-name buffer-file-name))
         (old backup-buffer-reference-file)
         (new buffer-file-name))
     (and (file-exists-p old)
          (with-temp-buffer
            (kill-all-local-variables)
            (diff-no-select old new nil 'noasync (current-buffer))
            (message "bk: %s"  diff-bk-file)
            (let ((make-backup-files nil))
              ;; (recentf-mode 'disable)
              (let ((message-log-max nil)
                    (inhibit-message t)
                    (recentf-list '()))
                (write-file diff-bk-file) ) ) ) ) ) )
 0
 'local)

(defun make-backup-uniq-name (fn)
  (let* ((basic-name (concat fn (format "%s%s"
                                        (format-time-string "_%H_")
                                        (if (boundp 'backup-buffer-reference-file) "" "REF_"))))
         (base-versions (concat (file-name-nondirectory basic-name) ".~"))
         (backup-extract-version-start (length base-versions))
         (high-water-mark 0)
         possibilities versions)
    (condition-case ()
        (setq possibilities (file-name-all-completions
                             base-versions
                             (file-name-directory basic-name))
              versions (sort (mapcar #'backup-extract-version possibilities) #'<)
              high-water-mark (apply 'max 0 versions))
      (file-error (setq high-water-mark nil)))
    (format "%s.~%d~" basic-name (1+ high-water-mark))))

(defun make-backup-file-name (fn)
  ((lambda (file)
     (let ((alist backup-directory-alist)
	   elt backup-directory abs-backup-directory)
       (while alist
	 (setq elt (pop alist))
	 (if (string-match (car elt) file)
	     (setq backup-directory (cdr elt)
		   alist nil)))
       (if backup-directory
	   (setq abs-backup-directory
		 (expand-file-name backup-directory
				   (file-name-directory file))))
       (if (and abs-backup-directory (not (file-exists-p abs-backup-directory)))
	   (condition-case nil
	       (make-directory abs-backup-directory 'parents)
	     (file-error (setq backup-directory nil
			       abs-backup-directory nil))))
       (let ((bkname
              (make-backup-uniq-name
	       (if (null backup-directory)
	           file
	         (expand-file-name (file-name-nondirectory file)
			           (file-name-as-directory abs-backup-directory))))))
         (or (boundp 'backup-buffer-reference-file)
             (s! backup-buffer-reference-file bkname))
         bkname)))
   fn))

(s! make-backup-file-name-function 'make-backup-file-name)

(setq backup-by-copying t
      ;; backup-by-copying-when-linked nil
      ;; backup-by-copying-when-mismatch t
      ;; backup-by-copying-when-privileged-mismatch 200000
      delete-old-versions 'not/trigger
      
      file-precious-flag t
      kept-new-versions 200000
      ;; kept-old-versions 200000
      make-backup-files t
      vc-make-backup-files t
      ;; version-control 'never ; this will force `make-backup-file-name-function`
      )

