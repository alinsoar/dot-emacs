
;; (s!
;;  lazy-highlight-face
;;  (face-remap-add-relative 'lazy-highlight
;;                           '(:strike-through "NavajoWhite4"
;;                             :underline (:style wave :color "red")
;;                             ;; :height 1.0
;;                             ;;:weight 1.0
;;                             )))

;; (s!
;;  isearch-face
;;  (face-remap-add-relative 'isearch
;;                           '(:strike-through "cyan"
;;                             :box "blue"
;;                             :underline (:style wave :color "blue")
;;                             ;; :height 1.0
;;                             ;; :weight 1.0
;;                             )))

(with-current-buffer (get-buffer " *Echo Area 0*")
  (s!
   echo-area-isearch-fail-face
   (face-remap-add-relative
    'isearch-fail
    '(:foreground "black"
      :underline (:style wave :color "red") )
    'default) ) )

(with-current-buffer (get-buffer " *Echo Area 1*")
  (s!
   echo-area-isearch-fail-face
   (face-remap-add-relative
    'isearch-fail
    '(:foreground "red"
      :underline (:style wave :color "red") )
    'default ) ) )
