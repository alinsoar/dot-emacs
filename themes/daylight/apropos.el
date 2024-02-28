
(define-theme-faces
 ;; BACKGROUND, FOREGROUND, FONT, FONT HEIGHT
  (default
    :FM "B612 Mono"
    :BG (divide-color "cyan" .6)
    :FG "maroon"
    :H 120
    )

 (apropos-function-button          :FG "black")
 (apropos-keybinding	           :FG "light coral")
 (apropos-misc-button	           :FG "brown")
 (apropos-property	           :FG "yellow")
 (apropos-symbol	           :FG "dark magenta")
 (apropos-user-option-button       :FG "dark green")
 (apropos-variable-button          :FG "blue")

 ;; (highlight              :U "yellow" :BG (divide-color "cyan" .6))
 
 ;; Mouse highlight
 (highlight :U "green"
            ;;:BG (divide-color "cyan" .6)
            )

 ;; REGION
 (region :U "orange" :ST "dark olive green" )

 ;; MODE-LINE
 ;; (mode-line                        :FG "orange red" :U "green"
 ;;                                   :BG (divide-color "cyan" .6)
 ;;                                   ;;:H 110
 ;;                                   )
 ;; (mode-line-inactive               :FG "gray40" :U "gray13"
 ;;                                   :BG (divide-color "cyan" .6)
 ;;                                   ;;:H 110
 ;;                                   )
 ;; (mode-line-buffer-id              :FG "blue"
 ;;                                   ;;:H 120
 ;;                                   )
 ;; (mode-line-emphasis               :W bold )
 ;; (mode-line-highlight              :U "deep sky blue" :O "dark orange" )


 
 )


