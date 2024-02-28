
(defun tab-line-kill-buffer (&optional event)
  "kill tab line buffer"
  (interactive (list last-nonmenu-event))
  (let* ((posnp (and (listp event) (event-start event)))
         (window (and posnp (posn-window posnp)))
         (tab (tab-line--get-tab-property 'tab (car (posn-string posnp))))
         (buffer (if (bufferp tab) tab (cdr (assq 'buffer tab))))
         (close-function (unless (bufferp tab) (cdr (assq 'close tab)))))
    (with-selected-window (or window (selected-window))
      (let ((menu-buf-count (length (tab-line-tabs-window-buffers))))
        (or (and (= 1 menu-buf-count)
                 (switch-to-buffer "*scratch*")
                 (equal "*scratch*" (buffer-name buffer)))
            (kill-buffer buffer))
        (force-mode-line-update)))))

(defun tab-line-next-buffer (&optional reversed non/loop)
  (interactive)
  (let* ((all (tab-line-tabs-window-buffers))
         (all2 (append all all))
         (buf/list (if reversed (reverse all2) all2))
         (next/buf (memq (current-buffer) buf/list)))
    (or (and non/loop ; disable looping while using mouse wheel
             (equal (current-buffer)
                    (car (if reversed all (last all)))))
        (tab-line-select-tab-buffer
         (and (consp next/buf)
              (cadr next/buf))
         (selected-window)))))

(defun tab-line-prev-buffer ()
  (interactive)
  (tab-line-next-buffer t))

(defun tab-line-mouse-next-buffer ()
  (interactive)
  (tab-line-next-buffer nil t))

(defun tab-line-mouse-prev-buffer ()
  (interactive)
  (tab-line-next-buffer t t))

(defun set-tab-name-read-minibuffer (x)
  (read-from-minibuffer x (current-tab-name)))

(defun set-tab-name ()
  (interactive)
  (let* ((count 0)
         (new/name (lambda () (format "workspace#%d" count))))
    (while (assoc (funcall new/name) (tab-names))
      (setq count (1+ count)))
    ;; (tab-bar-rename-tab "new workspace")
    (let ((inhibit-quit t))
      (unless
          (minibuffer-with-setup-hook
              (lambda ()
                (let ((update/tab/name
                       (lambda (b e l)
                         (tab-bar-rename-tab
                          (upcase (minibuffer-contents-no-properties))))))
                  (add-hook 'after-change-functions
                            update/tab/name 0 t)
                  (add-hook 'minibuffer-exit-hook
                            (lambda () (remove-hook 'after-change-functions
                                               update/tab/name t)))))
            (with-local-quit
              (and (thread-last (funcall new/name)
                     (format "RENAME WORKSPACE[%s]> ")
                     set-tab-name-read-minibuffer
                     (string= ""))
                   (tab-bar-rename-tab (funcall new/name)))
              'ok))
        (tab-bar-close-tab)))))
