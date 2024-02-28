
;;; inspired of `mouse-buffer-menu'

(setq x-menu-mode-groups
  `( ("elisp" . "Emacs Lisp")
     ("scheme" . "Scheme")
     ,@mouse-buffer-menu-mode-groups ))

(defun mouse-buffer-make-menu-alist (buffers)
  ;; See MENU in `x-popup-menu' for the format
  (mapcar (lambda (b) (cons (buffer-name b) b)) buffers))

(defun x-menu-map (buffers)
  (let (split-by-major-mode)
    (dolist (buf buffers)
      (with-current-buffer buf
        (let* ((adjusted-major-mode major-mode) elt)
          (dolist (group x-menu-mode-groups)
            (when (string-match (car group)
                    (format-mode-line mode-name))
              (setq adjusted-major-mode (cdr group))))
          (setq elt (assoc adjusted-major-mode split-by-major-mode))
          (unless elt
            (setq elt (list adjusted-major-mode
                            (if (stringp adjusted-major-mode)
                                adjusted-major-mode
                              (format-mode-line mode-name nil nil buf)))
                  split-by-major-mode (cons elt split-by-major-mode)))
          (or (memq buf (cddr elt))
              (setcdr (cdr elt) (cons buf (cddr elt)))))))
    (let (subdivided-menus (buffers-left (length buffers)))
      (while split-by-major-mode
	(let ((this-mode-list
                (mouse-buffer-make-menu-alist
                  (cddar split-by-major-mode))))
	  (setq subdivided-menus
	    (cons (cons
		    (nth 1 (car split-by-major-mode))
		    this-mode-list)
	      subdivided-menus)))
	(setq buffers-left
	      (- buffers-left (length (cdar split-by-major-mode))))
	(setq split-by-major-mode (cdr split-by-major-mode)))
      (cons "" (nreverse subdivided-menus)))))

(defun x-menu (event)
  (interactive "e")
  (mouse-minibuffer-check event)
  (let ((buf (x-popup-menu
              event
              (x-menu-map
               (tab-line-tabs-window-buffers))))
        (window (posn-window (event-start event))))
    (when buf
      (select-window
       (if (framep window) (frame-selected-window window)
         window))
      (switch-to-buffer buf))))

(defun x-tab-line-add-tab-menu ()
  (interactive)
  (let ((buf (x-popup-menu
              t
              (x-menu-map
               (buffer-list)))))
    (and buf (switch-to-buffer buf))))
