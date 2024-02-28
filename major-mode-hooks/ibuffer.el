

(load-config 'ibuffer)


;; HL-LINE
(and (is-x?)
     (hl-line-mode))

(load-theme 'ibuffer)

(s! ibuffer-use-header-line t)

(s! ibuffer-movement-cycle nil)

(s! ibuffer-marked-char ?$)

(s! ibuffer-jump-offer-only-visible-buffers nil)

(s! ibuffer-formats
    '((mark modified read-only " "
	    (name 30 35 :left :elide)
	    " "
	    (size 9 -1 :right)
	    " "
	    (mode 16 16 :left :elide)
	    " " filename-and-process)
      (mark " "
	    (name 16 -1)
	    " " filename)))

(s! ibuffer-expert nil)

(s! ibuffer-eliding-string "...")

(s! ibuffer-elide-long-columns t)

(s! ibuffer-display-summary t)

(s! ibuffer-directory-abbrev-alist nil)

(s! ibuffer-compressed-file-name-regexp
    "\\.\\(arj\\|bgz\\|bz2\\|gz\\|lzh\\|taz\\|tgz\\|xz\\|zip\\|z\\)$")

(s! ibuffer-filtering-alist
    '((predicate "predicate"
	         #[(buf qualifier)
		   ""
		   [buf qualifier eval]
		   2])
      (content "content"
	       #[(buf qualifier)
	         ""
	         [buf qualifier re-search-forward nil t]
	         4])
      (size-lt "size less than"
	       #[(buf qualifier)
	         ""
	         [buf qualifier buffer-size]
	         2])
      (size-gt "size greater than"
	       #[(buf qualifier)
	         ""
	         [buf qualifier buffer-size]
	         2])
      (filename "filename"
	        #[(buf qualifier)
	          ""
	          [buf ibuffer-aif-sym it qualifier ibuffer-buffer-file-name string-match]
	          4])
      (name "buffer name"
	    #[(buf qualifier)
	      ""
	      [qualifier buf string-match buffer-name]
	      4])
      (derived-mode "derived mode"
		    #[(buf qualifier)
		      ""
		      [buf qualifier derived-mode-p]
		      2])
      (used-mode "major mode in use"
	         #[(buf qualifier)
		   ""
                   []
		   ;; [qualifier buf buffer-local-value major-mode]
		   4])
      (mode "major mode"
	    #[(buf qualifier)
	      ""
              []
	      ;; [qualifier buf buffer-local-value major-mode]
	      4])))

(s! ibuffer-show-empty-filter-groups t)

(s! ibuffer-saved-filters
    
    '(("gnus"
       ((or
         (mode . message-mode)
         (mode . mail-mode)
         (mode . gnus-group-mode)
         (mode . gnus-summary-mode)
         (mode . gnus-article-mode))))
      ("programming"
       ((or
         (mode . emacs-lisp-mode)
         (mode . cperl-mode)
         (mode . c-mode)
         (mode . java-mode)
         (mode . idl-mode)
         (mode . emacs-lisp-mode)
         (mode . lisp-mode))))))

(s! ibuffer-filter-group-name-face 'bold)

(s! ibuffer-deletion-face 'error)

(s! ibuffer-filter-format-alist nil)

(s! ibuffer-fontification-alist
    '((10 buffer-read-only font-lock-constant-face)
      (15
       (and buffer-file-name
	    (string-match ibuffer-compressed-file-name-regexp buffer-file-name))
       font-lock-doc-face)
      (20
       (string-match "^*"
		     (buffer-name))
       font-lock-keyword-face)
      (25
       (and
        (string-match "^ "
		      (buffer-name))
        (null buffer-file-name))
       italic)
      (30
       (memq major-mode ibuffer-help-buffer-modes)
       font-lock-comment-face)
      (35
       (derived-mode-p 'dired-mode)
       font-lock-function-name-face)))


;;; disable mode line
(set-or-toggle-mode-line nil)

