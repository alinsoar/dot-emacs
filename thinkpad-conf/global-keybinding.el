
(define-key global-map (kbd "<C-mouse-8>")
  (lambda ()
    (interactive)
    (let ((bl (filtered-buffer-list) ) )
      (let ((buf (buffer-name (current-buffer) ) ) )
        (let ((lbl (length bl) ) )
          (let ((n (- lbl (length (member buf bl) ) ) ) )
            (let ((next (cond ((= n 0) lbl)
                              (t n) ) ) )
              (funcall s/buf/and/message (- (+ ?0 next) ) ) ) ) ) ) ) ) )

(define-key global-map (kbd "<C-mouse-9>")
  (lambda ()
    (interactive)
    (let ((bl (filtered-buffer-list) ) )
      (let ((buf (buffer-name (current-buffer) ) ) )
        (let ((lbl (length bl) ) )
          (let ((n (- lbl -1 -1 (length (member buf bl) ) ) ) )
            (let ((next (cond ((= n (1+ lbl) ) 1)
                              (t n) ) ) )
              (funcall s/buf/and/message (- (+ ?0 next) ) ) ) ) ) ) ) ) )

;;; jump where the mark was.  by default this is assigned to C-space
(define-key global-map [(control ?.)]
  (lambda ()
    (interactive)
    (set-mark-command 4) ) )

;;; Expand previous word ``dynamically``.  by default this is M-/
(define-key global-map [(control ?`)]
  'dabbrev-expand )

;;; Ibuffer by default, buffer-menu secondary
(define-key global-map [(control ?x) (control ?b)]
  (lambda (&optional arg)
    (interactive "P")
    (if arg
	(buffer-menu)
      (ibuffer) ) ) )

(define-key global-map [f11] 'switch-fullscreen)

(global-set-key [end] '-end)
(global-set-key [home] '-home)

(define-key global-map [f5] 'commute-buffer)

;;; Thinkpad browsing keys -- back and forth

(global-set-key [XF86Back]
                (lambda () (interactive) (scroll-down 1) (previous-line) ) )

(global-set-key [XF86Forward]
                (lambda () (interactive) (scroll-up 1) (next-line) ) )

(global-set-key [f4] 'speedbar-get-focus)

(global-set-key [(control ?x) f4] 'describe-char)
(global-set-key [(control ?c) f4] 'describe-text-properties)

;;; list processes
(global-set-key [(control ?x) ?p]
		(lambda ()
		  (interactive)
		  (list-processes nil (current-buffer) )  ) )

;;; dedicated window flag switch
(global-set-key (kbd "C-c w")
                (lambda ()
                  "TODO: add to mode line a symbol"
                  (interactive)
                  (let (window (get-buffer-window (current-buffer)))
                    (set-window-dedicated-p
                     window
                     (not (window-dedicated-p window)))
                    (message
                     (or (and (window-dedicated-p window)
                              "dedicated")
                         "non-dedicated")))))

;;; jump to definitions
(global-set-key [(control ?c) ?j ?f] 'find-function)
(global-set-key [(control ?c) ?j ?i] 'imenu)

;;; duplicating
(global-set-key (kbd "C-c d l") 'dup-current-line)
(global-set-key (kbd "C-c d s") 'dup-sexp)

;;; recentf
(global-set-key (kbd "C-c r") 'recentf-open-files)


;;; mark some empty lines with a specific color and pattern
(global-set-key (kbd "s-SPC") 'mark-empty-line)
(global-set-key (kbd "M-<henkan>") 'mark-empty-line)

;;; for the "Logitech MX Master 2S" mouse
;;; TODO: redo
(global-set-key (kbd "<down-mouse-8>") 'undo)
(global-set-key (kbd "<drag-mouse-8>") (lambda (&optional _)
                                         (interactive)
                                         (setq this-command 'undo) ))


;;; TODO!!!
;; [super-N] switches to buffer #N for N from 1 to 9. Filter out a few
;; unuseful buffers.
(dolist (n (number-sequence 1 9) )
  (define-key global-map
    (kbd (concat "<henkan> " (number-to-string n) ) )
    `(lambda ()
       (interactive)
       (funcall s/buf/and/message ,n) ) ) )

;;; ACE
(global-set-key [(control ?c) ?a ?s] 'ace-swap-window)

;;; repeating
(global-set-key (kbd "C-c s") 'repeat-shell-command)
(define-key global-map (kbd "C-:") 'repeat-complex-command)

(global-set-key (kbd "C-c y") 'get-syntax-class-at-point)

;;; toggle create-lockfiles
(define-toggle-variable create-lockfiles)
(global-set-key (kbd "C-c k") 'toggle-create-lockfiles)

;;; switch to *Messages*
(global-set-key (kbd "C-c m")
                (lambda ()
                  (interactive)
                  (switch-to-buffer "*Messages*")))

;;; make scratch
(global-set-key (kbd "C-c 0") 'make-scratch)

;;; C-z keymap -- inspired by Juri Linkov
(defvar c-z-keymap
  (let ((map (make-sparse-keymap))
        (c-z (global-key-binding "\C-z")))
    (global-unset-key "\C-z")
    (define-key global-map "\C-z" map)
    (define-key map "\C-z" c-z)
    map))
(run-hooks 'c-z-keymap-defined-hook)
;;; TODO: add private keybindings to this map
(define-key c-z-keymap [escape] esc-map)
(define-key c-z-keymap "r" 'revert-buffer)

;;; Incremental Search

(global-set-key (kbd "C-S-s") 'isearch-and-edit)

;;; mouse-mode-buffer-menu
(global-set-key [C-down-mouse-1] #'x-menu)
(global-set-key [tab-line down-mouse-3] 'x-tab-line-add-tab-menu)

;;; tab bar
(when (featurep 'tab-bar)
  (define-key global-map [(meta ?`)] 'tab-switch)
  (define-key global-map [(control meta ?`)] 'set-tab-name)
  (global-set-key [(control tab)] 'tab-bar-switch-to-next-tab)
  )

;;; tab line
(when (featurep 'tab-line)
  (define-key tab-line-tab-map (kbd "<tab-line> S-<mouse-2>") 'tab-line-kill-buffer)
  (global-set-key (kbd "M-<iso-lefttab>") 'tab-line-next-buffer)
  (global-set-key (kbd "<backtab>") 'tab-line-next-buffer)
  (global-set-key [(control meta tab)] 'tab-line-next-buffer)
  (global-set-key (kbd "<tab-line> <mouse-4>") 'tab-line-mouse-prev-buffer)
  (global-set-key (kbd "<tab-line> <mouse-5>") 'tab-line-mouse-next-buffer)
  )

;;; RESIZE WINDOW USING MOUSE
(global-set-key (kbd "S-C-<mouse-5>") 'resize--try-grow)
(global-set-key (kbd "S-C-<mouse-4>") 'resize--try-shrink)

(global-set-key (kbd "S-C-<wheel-up>") 'resize--try-grow)
(global-set-key (kbd "S-C-<wheel-down>") 'resize--try-shrink)
