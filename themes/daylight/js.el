
(define-theme-faces
  
  ;; (default :FM "Monaco" :BG "black" :FG "gray77" :H 120  )

  (default
    :FM (select-face
         ;; "Inconsolata"
         ;; "Anonymous Pro"
         "Monaco"
         )
    :BG (divide-color "lawn green" 1.2) 
    :FG (divide-color "deep sky blue" 3)
    :H  150 )

  ;; BUFFER-FACE-MODE
  (buffer-face-mode-face :FG "red")

  ;; ;; VARIABLE-PITCH
  ;; (variable-pitch ( :H 1.5) )

  ;; FONT-LOCK
  (font-lock-builtin-face          :FG "royal blue" )
  (font-lock-comment-delimiter-face :FG "DarkGreen" )
  (font-lock-comment-face          :FG "SaddleBrown" )
  (font-lock-constant-face         :FG "orange3" )
  (font-lock-doc-face              :FG "LightBlue4" ) ;NOT USED in python
  (font-lock-function-name-face    :FG "indian red" )
  (font-lock-keyword-face          :FG "DarkGoldenrod4" )
  (font-lock-negation-char-face    :FG "maroon1" :BG "LightSalmon2" )
  (font-lock-preprocessor-face     :FG "gray35" )
  (font-lock-regexp-grouping-backslash :FG "SpringGreen2" )
  (font-lock-regexp-grouping-construct :FG "coral2" )
  (font-lock-string-face           :FG "saddle brown" )
  (font-lock-type-face             :FG "OrangeRed1" )
  (font-lock-variable-name-face    :FG "forest green" )
  (font-lock-warning-face          :FG "honeydew3" ) ; NOT USED in python mode

  ;; HL-LINE
  (hl-line :U "red"  )

  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "red" :BG "black" )

  ;; REGION
  (region :U "orange" :ST "dark olive green" )

  ;; MODE-LINE
  ;; (mode-line                       :FG "orange red" :U "green"
  ;;                                  :BG (divide-color "spring green" .7) 
  ;;                                  ;;:H 110 
  ;;                                  )
  ;; (mode-line-inactive              :FG "gray40" :U "gray13"
  ;;                                  ;; :H 110  
  ;;                                  :BG (divide-color "spring green" .7) 
  ;;                                  )
  ;; (mode-line-buffer-id             :FG "deep pink" ;; :H 120
  ;;                                  )
  ;; (mode-line-emphasis              :W bold )
  ;; (mode-line-highlight             :U "deep sky blue" :O "dark orange" )

  ;; VERTICAL LINE -- just for TTY
  ;; (vertical-border ((t (:FG "lime green"))))

  ;; LEFT MARGIN
  (left-margin :BG "red" :FG "red" )

  ;; LINUM
  (linum :FG "OrangeRed3" :H 100 )
  )


