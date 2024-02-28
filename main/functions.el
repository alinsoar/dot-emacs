
;;; this shortcut is used in configurations for modes
(defalias 's! 'setq-local)

(defun filter (l property)
  (cond ((null l)
	 nil)
	((funcall property (car l))
	 (cons (car l)
	       (filter (cdr l) property ) ) )
	(t
	 (filter (cdr l) property) ) ) )

(defun dbg (&rest msg*)
  (let ((inhibit-message t))
    (apply #'message msg*)))

(defun dbg0 (&rest _) 'ok)

(defmacro define-toggle-variable (var)
  (let ((name (symbol-name var)))
   `(defun ,(intern (concat "toggle-" name)) ()
      ,(concat "toggle the value of the variable `" (symbol-name var) "`")
      (interactive)
      (setq ,var (not ,var))
      (message (concat ,name " is %s") ,var))))

(defun is-x? ()
  (equal (window-system) 'x))

(defun tab-names ()
  (mapcar (lambda (x)
            (cons (cdadr x) (eq (car x) 'current-tab)))
          (cdr (assoc 'tabs (frame-parameters)))))

(defun current-tab-name ()
  (thread-last (frame-parameters)
    (assoc 'tabs)
    cdr
    (assoc 'current-tab)
    cdr
    (assoc 'name)
    cdr))

(defun quit-window-kill-buffer ()
  (interactive)
  (quit-window t))

(defun set-or-toggle-mode-line (&optional value)
  ;; in interactive mode or calling from lisp with value=nil,
  ;; toggle the line.
  (interactive)
  (setq mode-line-format
        (cond ((and (numberp value)
                    (> value 0))
               (default-value 'mode-line-format))
              ((numberp value)
               (message "disable mode line")
               nil)
              (mode-line-format
               nil)
              ((default-value 'mode-line-format))))
  (redraw-display))

(global-set-key [M-f12] 'set-or-toggle-mode-line)

