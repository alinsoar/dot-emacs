
;; minor-mode-alist

;;; TODO
(setq mode-line-position-column-format '("%c"))
(setq mode-line-position-line-format '("%l"))

(defun mode-line-render (begin end)
  (let ((w (- (window-width)
              (length begin)
              (length end)
              5)))
    ;; (message "--%s--" w)
    (let ((middle (make-string (max 0 w) ? )))
     (concat begin middle end))))

(setq-default
 mode-line-format
 '((:eval
    (mode-line-render
     (format-mode-line '("%e"
                         mode-line-front-space
                         mode-line-mule-info mode-line-client
                         mode-line-modified
                         mode-line-remote
                         mode-line-frame-identification
                         mode-line-buffer-identification
                         " "
                         (vc-mode vc-mode)
                         " "
                         mode-line-modes
                         " "
                         mode-line-misc-info ; default: global-mode-string
                         " "
                         mode-line-end-spaces))
     (format-mode-line '("%l | %C"
                         (:eval (format "  @%d " (point)))
                         "%p%%" ))))))

