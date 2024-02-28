
;;; CONSTANTS

(defconst thinkpad-config-directory "./thinkpad-conf/"
  "the directory where the generic config files are found")

(defconst major-mode-initialization-hooks-directory "/major-mode-hooks/"
  "the directory where the initialization hooks for the major modes are found")

(defconst lib-directory "/lib/"
  "the directory where are kept shared tools.")

(defconst external-directory "/extern/"
  "the directory where elpa modules are kept")

(defconst themes-directory "/themes/"
  "the directory where are kept the color themes")

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(defvar library-files
  (let ((libs (directory-files
               (concat CONFIG-ROOT-DIR lib-directory) nil
               "^[[:alpha:]].*[.]el")))
   (mapcar 'intern
           (mapcar (lambda (x) (substring x 0 (- (length x) 3)))
                   libs))))

(defun load-lib (&rest files)
  (apply 'load-from-directory (cons lib-directory files)))

(defun load-config (file)
  (load-from-directory thinkpad-config-directory file))

(defun load-major-mode-hook (mode-file)
  (message "load major mode hook %s" mode-file)
  (condition-case nil
      (load-from-directory major-mode-initialization-hooks-directory mode-file)
    (error
     (message "there was an error loading %s" mode-file))))

(defun load-external (mod)
  "load.el from each external package should load the autoloads from melpa."
  (load-from-directory external-directory (intern (concat (symbol-name mod) "/load" ))))

(defun load-theme (mode)
  ;; (message "load theme: %s" mode)
  (cond ((eq COLOR-THEME t))
        ((eq COLOR-THEME nil))
        ((load-theme-config-file-p)
         (dbg "using theme %s for mode %s" COLOR-THEME mode)
         (load-from-directory themes-directory
                              (intern (concat COLOR-THEME "/" (symbol-name mode)))))))

(defun load-from-directory (directory &rest files)
  (let ((dir (concat CONFIG-ROOT-DIR "/" directory "/")))
    (mapcar (lambda (file)
              ;; TODO: load .elc files
              (load (expand-file-name
                     (concat dir (symbol-name file) ".el"))
                    nil t t nil))
            files)))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(defun check-dot-emacs-validity ()
  "add (load \"CURRENT-DIR/emacs-init.el\") to ~/.emacs and nothing more"
  (let ((emacs-init-file "~/.emacs")
	(err-msg (format
                  "%s %s --- %s, %s"
                  "~/.emacs MUST be a regular file and contain only 1 expression"
                  "that loads emacs-init.el file, and nothing more !"
                  "add (load \"DIR/emacs-init.el\") to ~/.emacs"
                  "changing `DIR` to the current directory of emacs-init.el")))

    (if (file-symlink-p emacs-init-file)
	(error "%s %s" "~/.emacs cannot be symlink;" err-msg))
    (with-temp-buffer
      (lisp-mode)
      (insert-file-contents emacs-init-file)
      (goto-char (point-min))
      (forward-sexp)
      (skip-syntax-forward "->")
      (when (< (point) (point-max))
	(setq-local visible-bell t)
	(warn err-msg)))))
