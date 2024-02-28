;; speedbar-buffer (get-buffer-create "SPEEDBAR")
      ;; speedbar-frame (selected-frame)
      ;; dframe-attached-frame (selected-frame)
      ;; speedbar-select-frame-method 'attached
 ;; speedbar-verbosity-level 0
;; speedbar-last-selected-file nil


;; (defcustom sr-speedbar-skip-other-window-p nil
;;   "Whether skip `sr-speedbar' window with `other-window'.
;; Default, can use `other-window' select window in cyclic
;; ordering of windows.  But sometimes we don't want select
;; `sr-speedbar' window use `other-window'.
;; Just want make `sr-speedbar' window as a view sidebar.

;; So please turn on this option if you want skip
;; `sr-speedbar' window with `other-window'.

;; Default is nil."
;;   :type 'boolean
;;   ;; :set (lambda (symbol value)
;;   ;;        (set symbol value)
;;   ;;        (if (fboundp 'ad-advised-definition-p)
;;   ;;            (when (ad-advised-definition-p 'other-window)
;;   ;;              (sr-speedbar-handle-other-window-advice value))
;;   ;;          (when (ad-is-advised 'other-window)
;;   ;;            (sr-speedbar-handle-other-window-advice value))))
;;   :group 'sr-speedbar)

;; (defun sr-speedbar-handle-other-window-advice (activate)
;;   "Handle advice for function `other-window'.
;; If ACTIVATE is `non-nil' enable advice `sr-speedbar-other-window-advice'.
;; Otherwise disable it."
;;   (if activate
;;       (ad-enable-advice 'other-window 'after 'sr-speedbar-other-window-advice)
;;     (ad-disable-advice 'other-window 'after 'sr-speedbar-other-window-advice))
;;   (ad-activate 'other-window))



;; (defcustom sr-speedbar-delete-windows nil
;;   "Allow the speedbar to delete other windows before showing up.
;; If nil, speedbar will not touch your window configuration.
;; Otherwise `delete-other-windows' will be called before showing
;; the speedbar.

;; Default is nil."
;;   :type 'boolean
;;   :group 'sr-speedbar)

;; (defun sr-speedbar-window-exist-p (window)
;;   (and window (window-live-p window)))

;; (defun sr-speedbar-buffer-exist-p (buffer)
;;   (and buffer (buffer-live-p buffer)))

;; (defun sr-speedbar-exist-p ()
;;   (and (sr-speedbar-buffer-exist-p speedbar-buffer)
;;        (sr-speedbar-window-exist-p sr-speedbar-window)))

;; (defun sr-speedbar-open ()
;;   "Create `sr-speedbar' window."
;;   (interactive)
;;   (require 'speedbar)
;;   (if (not (sr-speedbar-exist-p))
;;       (let ((current-window (selected-window)))
;;         ;; Ensure only one window is there
;;         ;; when `sr-speedbar-delete-windows' is non-nil
;;         (if sr-speedbar-delete-windows
;;             (delete-other-windows))
;;         ;; Whether activate `other-window' advice
;;         ;; to skip `sr-speedbar' window when use `other-window'.
;;         (sr-speedbar-handle-other-window-advice sr-speedbar-skip-other-window-p)
;;         ;; Switch buffer
;;         (if (sr-speedbar-buffer-exist-p speedbar-buffer)
;;             (unless (sr-speedbar-window-exist-p sr-speedbar-window)
;;               (sr-speedbar-get-window))
;;           (if (<= (sr-speedbar-current-window-take-width) sr-speedbar-width)
;;               (setq sr-speedbar-width sr-speedbar-default-width))
;;           (sr-speedbar-get-window)             ;get `sr-speedbar' window that split current window
;;           (setq speedbar-buffer (get-buffer-create sr-speedbar-buffer-name)
;;                 speedbar-frame (selected-frame)
;;                 dframe-attached-frame (selected-frame)
;;                 speedbar-select-frame-method 'attached
;;                 speedbar-verbosity-level 0 ;don't say anything, i don't like ... :)
;;                 speedbar-last-selected-file nil)
;;           (set-buffer speedbar-buffer)
;;           (buffer-disable-undo speedbar-buffer) ;make disable in speedbar buffer, otherwise will occur `undo-outer-limit' error
;;           (speedbar-mode)
;;           (speedbar-reconfigure-keymaps)
;;           (speedbar-update-contents)
;;           (speedbar-set-timer 1)
;;           ;; Add speedbar hook.
;;           (add-hook 'speedbar-before-visiting-file-hook 'sr-speedbar-before-visiting-file-hook t)
;;           (add-hook 'speedbar-before-visiting-tag-hook 'sr-speedbar-before-visiting-tag-hook t)
;;           (add-hook 'speedbar-visiting-file-hook 'sr-speedbar-visiting-file-hook t)
;;           (add-hook 'speedbar-visiting-tag-hook 'sr-speedbar-visiting-tag-hook t)
;;           ;; Add `kill-buffer-hook'.
;;           (add-hook 'kill-buffer-hook 'sr-speedbar-kill-buffer-hook) ;add `kill-buffer-hook'
;;           ;; Auto refresh speedbar content
;;           ;; if option `sr-speedbar-auto-refresh' is non-nil
;;           (sr-speedbar-handle-auto-refresh sr-speedbar-auto-refresh))
;;         (set-window-buffer sr-speedbar-window (get-buffer sr-speedbar-buffer-name))
;;         (set-window-dedicated-p sr-speedbar-window t) ;make `sr-speedbar-window' dedicated to speedbar-buffer.
;;         (select-window current-window))
;;     (message "`sr-speedbar' window has exist.")))


;; ;; (defun speedbar-inside-frame ()
;; ;;   (interactive)
;; ;;   (require 'speedbar)
;; ;;   (setq speedbar-buffer (get-buffer-create "SPEEDBAR")
;; ;;         speedbar-frame (selected-frame)
;; ;;         dframe-attached-frame (selected-frame)
;; ;;         speedbar-select-frame-method 'attached
;; ;;         speedbar-verbosity-level 0
;; ;;         speedbar-last-selected-file nil)
;; ;;   (setq right-window (split-window-horizontally 30))
;; ;;   (setq left-window (frame-first-window))

;; ;;   (set-buffer speedbar-buffer)
;; ;;   (speedbar-mode)
;; ;;   (speedbar-reconfigure-keymaps)
;; ;;   (speedbar-update-contents)
;; ;;   (speedbar-set-timer 1)
;; ;;   (set-window-buffer left-window "SPEEDBAR")
;; ;;   (dbg "A")
;; ;;   (set-window-dedicated-p left-window t)
;; ;;   (toggle-read-only) ; for tramp
;; ;;   (select-window right-window)

  
;; ;;   )

