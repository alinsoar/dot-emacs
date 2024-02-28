
;; (dolist (x erc-mode-values)
;;   (set (make-local-variable (car x)) (cadr x)))

(define-theme-faces
 ;; BACKGROUND, FOREGROUND, FONT, FONT HEIGHT
  (default
    :FM "Monaco"
    :H 150
    :FG "NavajoWhite"
    :BG "medium aquamarine"
    )

 ;; ALL FACES OF ERC

 (erc-action-face :FG "red")
 (erc-bold-face :FG "red")
 (erc-button )
 (erc-capab-identify-unidentified )
 (erc-command-indicator-face             :FG "dark green" )
 (erc-current-nick-face                  :FG "orange red" )
 (erc-dangerous-host-face )
 (erc-default-face                       :FG "black")
 (erc-direct-msg-face                    :FG "dark green")
 (erc-error-face )
 (erc-fool-face )
 (erc-header-line                        :U "gold4")
 (erc-input-face                         :FG "DarkGoldenrod1" )
 (erc-inverse-face                       :O "honeydew" )
 (erc-keyword-face                       :FG "honeydew" )
 (erc-my-nick-face                       :FG "aquamarine" )
 (erc-nick-default-face                  :FG "dark khaki" )
 (erc-nick-msg-face                      :FG "PaleGreen" )
 (erc-notice-face                        :FG "thistle4" )
 (erc-pal-face )
 (erc-prompt-face                        :FG "brown" )
 (erc-timestamp-face                     :FG "chocolate" :U "LemonChiffon" )
 (erc-underline-face                     :U t )
 (fg:erc-color-face0 )
 (fg:erc-color-face1 )
 (fg:erc-color-face10 )
 (fg:erc-color-face11 )
 (fg:erc-color-face12 )
 (fg:erc-color-face13 )
 (fg:erc-color-face14 )
 (fg:erc-color-face15 )
 (fg:erc-color-face2 )
 (fg:erc-color-face3 )
 (fg:erc-color-face4 )
 (fg:erc-color-face5 )
 (fg:erc-color-face6 )
 (fg:erc-color-face7 )
 (fg:erc-color-face8 )
 (fg:erc-color-face9 )

 (bg:erc-color-face0 )
 (bg:erc-color-face1 )
 (bg:erc-color-face10 )
 (bg:erc-color-face11 )
 (bg:erc-color-face12 )
 (bg:erc-color-face13 )
 (bg:erc-color-face14 )
 (bg:erc-color-face15 )
 (bg:erc-color-face2 )
 (bg:erc-color-face3 )
 (bg:erc-color-face4 )
 (bg:erc-color-face5 )
 (bg:erc-color-face6 )
 (bg:erc-color-face7 )
 (bg:erc-color-face8 )
 (bg:erc-color-face9 )

 (region :U "red" )

 ;; MODE-LINE
 ;; (mode-line                        :FG "orange red" :U "green" :H 110 )
 ;; (mode-line-inactive               :FG "gray40" :U "gray13" :H 110 )
 ;; (mode-line-buffer-id              :FG "deep sky blue" :H 120 )
 ;; (mode-line-emphasis               :W bold )
 ;; (mode-line-highlight              :U "deep sky blue" :O "dark orange" )

 ;; MOUSE HIGHLIGHT
 (highlight :U "cyan")

 (header-line :BG "cyan"
              :FG "red"
              :U "brown")
 )

