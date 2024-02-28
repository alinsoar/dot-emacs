
(define-theme-faces
 ;; BACKGROUND, FOREGROUND, FONT, FONT HEIGHT
  (default
    :FM "Monaco"
    :BG (divide-color "sea green" 0.7)
    :FG "black"
    :H 120  )

 (help-argument-name :FG "DodgerBlue1" )

 ;; ;; BUFFER-FACE-MODE
 ;; (buffer-face-mode-face )

 (font-lock-keywords :FG "red")

 ;; ;; VARIABLE-PITCH
 ;; (variable-pitch ( :H 1.5) )


 ;; (help-function-button :FG "green" :U "blue")
 (help-key-binding :FG "red")
 
 (button :FG "dark green")

 
 ;; FRINGE -- FRAME SPECIFIC
 (fringe :FG "red" :BG "black" )

 ;; REGION
 (region :U "orange" :ST "dark olive green" )

 ;; MODE-LINE
 ;; (mode-line                        :FG "orange red" :U "green"
 ;;                                   :BG "SpringGreen"
 ;;                                   ;;:H 110  
 ;;                                   )
 ;; (mode-line-inactive               :FG "gray40" :U "gray13"
 ;;                                   :BG "SpringGreen"
 ;;                                   ;;:H 110  
 ;;                                   )
 ;; (mode-line-buffer-id              :FG "deep sky blue" ;;:H 120
 ;;                                   )
 ;; (mode-line-emphasis               :BX "red" )
 ;; (mode-line-highlight              :U "deep sky blue" :O "dark orange" )

 (button :FG "DarkGoldenrod2" :ST "gray10" )

 (highlight :FG "red" :U "blue" )

 
 ;; VERTICAL LINE -- just for TTY
 ;; (vertical-border ((t (:FG "lime green"))))

 ;; LEFT MARGIN
 (left-margin :BG "red" :FG "red" )
 )

;; buffer-name can be: "*Pp Eval Output*"
