
;; (s! c-tab-always-indent t)

;; ;; One of: 
;; ;;     plain
;; ;;     indent-or-triple
;; ;;     indent
;; ;;     aligned
;; ;;     box
;; ;;     extra-line
;; ;;     multi-line
;; ;;     box-multi
;; (s! comment-style 'plain)

;; ;;; hide ^M -- windows newlines
;; (setq buffer-display-table (make-display-table))
;; (aset buffer-display-table ?\^M [])

;; (s! c-echo-syntactic-information-p t)

;; (local-set-key (kbd "C-c s")
;;                (lambda ()
;;                  (interactive)
;;                  (setq comment-style
;;                        (completing-read "?" (mapcar 'car comment-styles)))))



