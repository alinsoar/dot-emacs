
;;; (macroexpand '(make-initialization-hook test))
(defmacro make-initialization-hook (mode)
  "generates initialization hooks for major modes in this pattern:
     (lambda ()
       'Initialization function for prolog mode hook.'
       (load-major-mode-hook MODE))"
  `(list 'lambda
	 nil
	 (concat "Initialization function for " (symbol-name ,mode) " mode hook.")
	 (list 'load-major-mode-hook (list 'quote ,mode) ) ) )

(defun make-major-mode-initialization-hook (hook-list)
  (mapc
   (lambda (x)
     (let ((w (if (listp x) x (list x x))))
       (let ((mode (car w))
	     (hook (cadr w)))
         (let ((mode-name (concat (symbol-name mode) "-mode-hook"))
	       (call-name (concat (symbol-name hook) "-init-conf-function")))
	   (fset (intern call-name) (make-initialization-hook hook) )
           (add-hook (intern mode-name) (intern call-name))
           (message "add %s to %s" call-name mode-name) ) ) ) )
   hook-list))

(defconst
  major-modes-hooks-list
  '(
    ;; (lisp emacs-lisp)
    ;; (lisp-interaction emacs-lisp)
    ;; ielm
    emacs-lisp
    prolog
    comint
    scheme
    dired
    (bookmark-bmenu bookmarks)
    makefile
    ibuffer
    ;; messages-buffer
    c
    erc
    python
    mhtml
    (js java-script)
    (css cascading-style-sheets)
    artist
    shell
    (Info info)
    help
    messages-buffer
    package-menu
    apropos
    completion-list
    occur
    (sh shell-script)
    magit-status
    magit-log
    magit-refs
    magit-revision
    (Man man)
    debugger
    speedbar
    which-function
    tab-bar
    wdired
    image
    widget-browse
    tab-line
    latex
    inferior-scheme
    sql
    (hs-minor hide-show)
    haskell
    sql-interactive


    ))

(make-major-mode-initialization-hook major-modes-hooks-list)

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(add-hook 'isearch-mode-hook 'isearch-setup)
(add-hook 'isearch-mode-end-hook 'isearch-exit)
(add-hook 'minibuffer-setup-hook 'minibuffer-setup)
(add-hook 'emacs-startup-hook 'startup-time)

(defun minibuffer-setup ()
  (interactive)
  (load-config 'minibuffer-setup) )

(defun isearch-setup ()
  (interactive)
  (load-config 'isearch-setup) )

(defun isearch-exit ()
  (interactive)
  (load-config 'isearch-exit) )

(defun startup-time ()
  (interactive)
  (load-config 'emacs-startup)  )


