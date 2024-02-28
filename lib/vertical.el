;;; -*- lexical-binding: t; buffer-read-only:t -*-

(defconst vertical--inside-minibuffer-map
  (let ((map (make-composed-keymap nil minibuffer-local-map)))
    ;; MOVING THE INDEX
    (define-key map [remap beginning-of-buffer] #'-first)
    (define-key map [remap minibuffer-beginning-of-buffer] #'-first)
    (define-key map [remap end-of-buffer] #'-last)
    (define-key map [remap minibuffer-beginning-of-buffer] #'-last)
    (define-key map [remap next-line] #'vertical--next-index)
    (define-key map [remap next-line-or-history-element] #'vertical--next-index)
    (define-key map [remap previous-line] #'vertical--previous-index)
    (define-key map [remap previous-line-or-history-element] #'vertical--previous-index)
    ;; OTHER MINIBUFFER FUNCTIONS
    (define-key map [remap exit-minibuffer] #'vertical--exit)
    (define-key map (kbd "TAB") #'vertical--tab-complete)
    (define-key map " " #'vertical--space)
    ;; mouse
    (define-key map (kbd "<wheel-up>") #'vertical--previous-first-index)
    (define-key map (kbd "<wheel-down>") #'vertical--next-first-index)
    (define-key map (kbd "<double-wheel-up>") #'vertical--previous-double-first-index)
    (define-key map (kbd "<double-wheel-down>") #'vertical--next-double-first-index)
    (define-key map (kbd "<triple-wheel-up>") #'vertical--previous-page-first-index)
    (define-key map (kbd "<triple-wheel-down>") #'vertical--next-page-first-index)
    ;; mouse
    (define-key map (kbd "<mouse-4>") #'vertical--previous-first-index)
    (define-key map (kbd "<mouse-5>") #'vertical--next-first-index)
    (define-key map (kbd "<double-mouse-4>") #'vertical--previous-double-first-index)
    (define-key map (kbd "<double-mouse-5>") #'vertical--next-double-first-index)
    (define-key map (kbd "<triple-mouse-4>") #'vertical--previous-page-first-index)
    (define-key map (kbd "<triple-mouse-5>") #'vertical--next-page-first-index)
    ;; 
    (define-key map (kbd "<prior>") #'vertical--previous-page-first-index)
    (define-key map (kbd "<next>") #'vertical--next-page-first-index)
    ;; EDIT INPUT
    (define-key map (kbd "S-<backspace>") #'vertical--remove-to-up-dir)
    (define-key map (kbd "C-<return>") #'vertical--complete-entry)
    map)
  "keymap derived from `minibuffer-local-map'")

(defvar-local vertical--menu-o nil)
(defvar-local vertical--count-o nil)

(defvar vertical--max-menu-display-count 20)
(defvar vertical--menu-first-index)
(defvar vertical--menu-pointer-index)
(defvar vertical--menu-candidates '())

(defvar c/table)
(defvar c/pred)
(defvar c/category)
(defvar c/base)
(defvar c/base-1)
(defvar c/bounds)
(defvar c/after)
(defvar c/before)
(defvar c/content)

;;; ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * INTERACTIVE

(defun vertical--tab-complete-try-next (candidates)
  ;; TODO: make case sensitive or insensitive. FOR TAGS:inse. For BUFFERS:sesi.
  (let ((next (seq-uniq
               (mapcar
                (lambda (c) (and (not (string-empty-p c))
                            (substring c 0 1)))
                candidates))))
    (if (and (= 1 (length next)) (stringp (car next)))
        (concat (car next)
                (vertical--tab-complete-try-next
                 (mapcar (lambda (x) (substring x 1))
                         candidates)))
      "")))

(defun vertical--tab-complete ()
  "insert in minibuffer the maximal prefix common to all candidates"
  (interactive)
  (unless (null vertical--menu-candidates)
    (let ((input (substring (minibuffer-contents-no-properties) c/base)))
      (insert (vertical--tab-complete-try-next
               (mapcar (lambda (x) (substring x (length input)))
                       vertical--menu-candidates))))))

(defun vertical--space (&optional _)
  (interactive)
  ;; TODO: use flex matching instead
  (insert "-"))

(defun vertical--exit (&optional arg)
  (interactive "P")
  (vertical--complete-entry)
  (exit-minibuffer))

(defun vertical--remove-to-up-dir ()
  (interactive)
  (let* ((to (point-max))
         (from (+ (point-max) c/base-1 (- (length c/content)))))
    (delete-region from to)))

(defun vertical--complete-entry ()
  (interactive)
  (when (> vertical--menu-pointer-index -1)
    (delete-minibuffer-contents)
    (insert (substring-no-properties c/before 0 c/base))
    (insert (substring-no-properties
             (nth (vertical--menu-index)
                  vertical--menu-candidates)))))

;;; Pointer Index
(defmacro vertical--def-pointer (f code)
  `(defun ,f nil (interactive) (vertical--recompute-menu-pointer-index! ,code)))
(vertical--def-pointer vertical--next-index 1)
(vertical--def-pointer vertical--previous-index -1)

;;; First Index
(defmacro vertical--def-first (f code)
  `(defun ,f nil (interactive) (vertical--recompute-menu-first-index! ,code)))
(vertical--def-first vertical--next-first-index 1)
(vertical--def-first vertical--previous-first-index -1)
(vertical--def-first vertical--next-double-first-index (/ (vertical--count-minibuffer-lines) 4))
(vertical--def-first vertical--previous-double-first-index (- (/ (vertical--count-minibuffer-lines) 4)))
(vertical--def-first vertical--next-page-first-index (/ (vertical--count-minibuffer-lines) 2))
(vertical--def-first vertical--previous-page-first-index (- (/ (vertical--count-minibuffer-lines) 2)))

;;; ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * HELPERS

(defun vertical--format-count ()
  (format "%s/%s "
          (if (= -1 vertical--menu-pointer-index)
              "*"
            (1+ (vertical--menu-index)))
          (length vertical--menu-candidates)))

(defun vertical--recompute-menu-pointer-index! (n)
  (or (null vertical--menu-candidates)
      (let ((new/index (+ vertical--menu-pointer-index n)))
        (setq vertical--menu-pointer-index
              (cond
               ((< new/index 0) -1)
               ((> new/index (vertical--count-minibuffer-lines))
                (vertical--count-minibuffer-lines))
               ((< (+ new/index vertical--menu-first-index)
                   (length vertical--menu-candidates))
                new/index)
               (t (1- (- (length vertical--menu-candidates)
                         vertical--menu-first-index))))))))

(defun vertical--recompute-menu-first-index! (n)
  (let ((new/index (+ n vertical--menu-first-index)))
    (setq vertical--menu-first-index
          (cond
           ((< new/index 0) 0)
           ((< (+ new/index vertical--menu-pointer-index)
               (length vertical--menu-candidates))
            new/index)
           (t
            (1- (- (length vertical--menu-candidates)
                   vertical--menu-pointer-index)))))))

(defun vertical--menu-index ()
  (+ vertical--menu-first-index vertical--menu-pointer-index))

(defun vertical--iter--menu-candidates (candidates max-deep i call)
  (if (or (> i max-deep)
          (null candidates))
      '()
    (cons (funcall call (car candidates) i)
          (vertical--iter--menu-candidates (cdr candidates) max-deep (1+ i) call))))

(defun vertical--info-keybindings (cand)
  (when-let*
      ((s (intern-soft cand))
       (key (and (commandp s) (where-is-internal s nil 'first-only))))
    (format " (%s)" (key-description key))))

(defun vertical--count-minibuffer-lines ()
  (1+ (/ (window-pixel-height (minibuffer-window)) (default-line-height) )))

;;; ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * EXHIBIT

(defun vertical--display-count ()
  (when vertical--count-o
    (move-overlay vertical--count-o (point-min) (point-min))
    (overlay-put vertical--count-o 'priority 1) ;; for minibuffer-depth-indicate-mode
    (overlay-put vertical--count-o 'before-string (vertical--format-count))))

(defun vertical--display-menu ()
  (move-overlay vertical--menu-o (point-max) (point-max))
  (overlay-put vertical--menu-o 'after-string
               (apply #'concat #(" " 0 1 (cursor t))
                      (vertical--iter--menu-candidates
                       (nthcdr vertical--menu-first-index vertical--menu-candidates)
                       (max vertical--max-menu-display-count
                            (vertical--count-minibuffer-lines))
                       0
                       (lambda (cand i)
                         (concat
                          "\n"
                          (if (= i vertical--menu-pointer-index) "~>" "  ")
                          cand
                          (vertical--info-keybindings cand)))))))

(defun vertical--sort-candidates ()
  (setq vertical--menu-candidates
        (sort vertical--menu-candidates 'string<)))

(defun vertical--make-completions ()
  (let ((while-no-input-ignore-events '(selection-request))
        (non-essential t) )
    (while-no-input
      (let* ((buffer-undo-list t) ; overlays mutate point and undo list
             (pt (max 0 (- (point) (minibuffer-prompt-end))))
             (content (minibuffer-contents-no-properties))
             (before (substring content 0 pt))
             (after (substring content pt))
             (metadata (completion-metadata before c/table c/pred))
             (bounds (condition-case nil
                         (completion-boundaries before c/table c/pred after)
                       (t (cons 0 (length after)))))
             (all (completion-all-completions content c/table c/pred pt metadata))
             (all-1 (completion-all-completions content c/table c/pred (max 0 (1- pt)) metadata))
             (completion/base (or (when-let (z (last all)) (prog1 (cdr z) (setcdr z nil))) 0))
             (completion/base-1 (or (when-let (z (last all-1)) (prog1 (cdr z) (setcdr z nil))) 0)))
        (or (eq c/category (completion-metadata-get metadata 'category))
            (error "!! category changed"))
        (when (/= (length all) (length vertical--menu-candidates)) ; reset when new input
          (setq vertical--menu-pointer-index -1
                vertical--menu-first-index 0))
        (setq vertical--menu-candidates all
              c/base completion/base
              c/base-1 completion/base-1
              c/bounds bounds
              c/after after
              c/before before
              c/content content
              )))))

(defun vertical--exhibit ()
  (vertical--make-completions)
  (vertical--sort-candidates)
  (vertical--display-menu)
  (vertical--display-count))

;;; ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * SETUP

(defun vertical--enter/minibuffer (orig &rest args)
  (minibuffer-with-setup-hook
      (lambda ()
        ;; completing-read is executed inside the minibuffer
        (or (minibufferp (current-buffer))
            (window-minibuffer-p)
            (error "wrong place ~ %s" (current-buffer)))
        (setq vertical--menu-pointer-index -1
              vertical--menu-first-index 0
              max-lisp-eval-depth 1000000)
        (setq-local
         resize-mini-windows 'grow-only
         enable-recursive-minibuffers nil
         max-mini-window-height 0.35
         vertical--menu-o (make-overlay
                           (point-max) (point-max) nil t t)
         vertical--count-o (make-overlay
                            (point-min) (point-min) nil t t)
         completion-auto-help nil
         completion-show-inline-help nil
         ;; 
         c/table minibuffer-completion-table
         c/pred minibuffer-completion-predicate
         c/category (completion-metadata-get
                     (completion-metadata "" c/table c/pred)
                     'category))
        (message "vertical completion category: %s" c/category)
        (use-local-map vertical--inside-minibuffer-map)
        ;; ensure that the `completing-read-function' runs earlier, such
        ;; that the candidates are available
        (add-hook 'post-command-hook
                  #'vertical--exhibit -60 'local)
        (add-hook 'minibuffer-exit-hook
                  (lambda () (remove-hook 'post-command-hook #'vertical--exhibit 'local)))
        ;; disable other completion modes -- TODO
        (and icomplete-mode (icomplete-mode -1)))
    (apply orig args)))

(define-minor-mode vertical-mode
  "Vertical Extended Command"
  :global t
  (if vertical-mode
      (progn
        (advice-add #'completing-read-default :around 'vertical--enter/minibuffer)
        (advice-add #'completing-read-multiple :around 'vertical--enter/minibuffer) )
    (advice-remove #'completing-read-default 'vertical--enter/minibuffer)
    (advice-remove #'completing-read-multiple 'vertical--enter/minibuffer) ) )

