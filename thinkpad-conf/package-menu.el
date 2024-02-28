


(when (>= emacs-major-version 24)
  (mapc (lambda (p) (add-to-list 'package-archives p 'at-the-end))
        '(;; ("melpa" . "http://melpa.milkbox.net/packages/")
          ("melpa" . "http://melpa.org/packages/")
          ;; ("marmalade" . "http://marmalade-repo.org/packages/")
          ))
  (package-initialize))

;;; refresh content with `package-menu-refresh` (keybinding r)

;;; list-packages

