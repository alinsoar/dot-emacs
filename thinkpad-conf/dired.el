
(defvar dired-sort-by-default-option "alphabetically")

(defconst dired-sort-by-options
  '( ("size"           . "-laS")
     ("none"           . "-laU")
     ("time"           . "-lat")
     ("version"        . "-lav")
     ("extension"      . "-laX")
     ("alphabetically" . "-la")))

(defun dired-sort-by (by)
  (interactive
   (list
    (progn
      (setq dired-sort-by-default-option
            (ido-completing-read
             "sort by: "
             (mapcar 'car dired-sort-by-options)))
      dired-sort-by-default-option)))
  (when-let ((by (assoc by dired-sort-by-options)))
    (dired-sort-other (cdr by))))

(dired-sort-by dired-sort-by-default-option) ; default sort by extension

(define-key dired-mode-map "s" 'dired-sort-by)

;; edit file names
(define-key dired-mode-map
  [(control ?x) (control ?e)]
  'dired-toggle-read-only )

(local-set-key  [(control ?c) (control ?q)]
                (lambda ()
                  (interactive)
                  (dired-hide-details-mode)
                  ;; (dired-omit-mode)
                  ))

(defun dired-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
   (let (buffer-read-only)
     ;; (forward-line :BG (divide-color "sea green" 0.7)2) ;; beyond dir. header  
     (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))

(add-hook 'dired-after-readin-hook 'dired-sort)

(dired-file-split-faces  c "c" "h")
(dired-file-split-faces  python "py")
(dired-file-split-faces  javascript "js")
(dired-file-split-faces  emacs-lisp "el")
(dired-file-split-faces  compiled "o" "bci" "bin" "com" "ext")
(dired-file-split-faces  scheme "scm")
(dired-file-split-faces  racket "rkt")
(dired-file-split-faces  archive "zip" "bz2" "gz" "tar")
(dired-file-split-faces  imagefile "jpg" "png" "gif" "svg" "ico")
(dired-file-split-faces  java "java")
(dired-file-split-faces  pdf "pdf")
(dired-file-split-faces  dejavu "djvu")
(dired-file-split-faces  text "txt")
(dired-file-split-faces  hypertext "html")
(dired-file-split-faces  style-sheets "css")
(dired-file-split-faces  sql "sql")
(dired-file-split-faces  php "php")
(dired-file-split-faces  shell "sh")

(make-filename-colors fileinfo-entries
                      "[ ]\\([mM][aA][kK][eE][fF][iI][lL][eE]\\)"
                      "\\(.*\\)"
                      (1 makefile)
                      (2 makefile-ext))

(make-filename-colors fileinfo-entries
                      "[ ]\\([[:upper:]]*\\)"
                      ""
                      (1 uppercase) )

(make-filename-colors fileinfo-entries
                      "[ ]\\(config.*\\)"
                      ""
                      (1 config) )

(make-filename-colors fileinfo-data
                      ""
                      ".*"
                      (1 hardlink-count)
                      (2 user)
                      (3 group)
                      (4 size)
                      (5 month)
                      (6 day)
                      (7 year-hour))

(local-set-key (kbd "q") 'quit-window-kill-buffer)

(setq
 dired-omit-size-limit nil
 dired-omit-files
 ;;; "\\`[.]?#\\|\\`[.][.]?\\'"
 (mapconcat (lambda (x) x)
            '(
              "\\`[.]?#"
              "^[.]$"
              ;; "\\`[.][.]?\\'"
              "autom4te.cache"
              )
            "\\|")
 dired-omit-extensions
      '(".o"
        "~"
        ".bin"
        ".lbin"
        ".so"
        ".a"
        ".ln"
        ".blg"
        ".bbl"
        ".elc"
        ".lof"
        ".glo"
        ".idx"
        ".lot"
        ".svn/"
        ".hg/"
        ".git/"
        ".bzr/"
        "CVS/"
        "_darcs/"
        "_MTN/"
        ".fmt"
        ".tfm"
        ".class"
        ".fas"
        ".lib"
        ".mem"
        ".x86f"
        ".sparcf"
        ".dfsl"
        ".pfsl"
        ".d64fsl"
        ".p64fsl"
        ".lx64fsl"
        ".lx32fsl"
        ".dx64fsl"
        ".dx32fsl"
        ".fx64fsl"
        ".fx32fsl"
        ".sx64fsl"
        ".sx32fsl"
        ".wx64fsl"
        ".wx32fsl"
        ".fasl"
        ".ufsl"
        ".fsl"
        ".dxl"
        ".lo"
        ".la"
        ".gmo"
        ".mo"
        ".toc"
        ".aux"
        ".cp"
        ".fn"
        ".ky"
        ".pg"
        ".tp"
        ".vr"
        ".cps"
        ".fns"
        ".kys"
        ".pgs"
        ".tps"
        ".vrs"
        ".pyc"
        ".pyo"
        ".idx"
        ".lof"
        ".lot"
        ".glo"
        ".blg"
        ".bbl"
        ".cp"
        ".cps"
        ".fn"
        ".fns"
        ".ky"
        ".kys"
        ".pg"
        ".pgs"
        ".tp"
        ".tps"
        ".vr"
        ".vrs"
        ".bci"
        ".com"
        ".ext"
        ".fre"
        ".binld"
        ".comld"
        ".bcild"
        ".pkd"
        ))

