
;; todo
;; occur ; multi-occur
(define-theme-faces
  ;; BACKGROUND, FOREGROUND, FONT, FONT HEIGHT
  (default
    :BG "pale goldenrod"
    :FG "#002020"
    :H 120
    )

  (match :U "black" :BX "red")

  ;; SYNTAX
  (font-lock-builtin-face          :FG "royal blue"  )
  (font-lock-comment-delimiter-face :FG "DarkGreen"    )
  (font-lock-comment-face          :FG "SaddleBrown"   )
  (font-lock-constant-face         :FG "red"   )
  (font-lock-doc-face              :FG "LightBlue4"   )
  (font-lock-function-name-face    :FG "indian red"   )
  (font-lock-keyword-face          :FG "DarkGoldenrod4"   )
  (font-lock-negation-char-face    :FG "maroon1" :BG "LightSalmon2"  )
  (font-lock-preprocessor-face     :FG "gray35"   )
  (font-lock-regexp-grouping-backslash :FG "SpringGreen2"   )
  (font-lock-regexp-grouping-construct :FG "coral2"   )
  (font-lock-string-face           :FG (divide-color "SpringGreen4" 1) )
  (font-lock-type-face             :FG "OrangeRed1"   )
  (font-lock-variable-name-face    :FG "LightSeaGreen"  )
  (font-lock-warning-face          :FG "honeydew3"  )

  ;; MODE-LINE
  ;; (mode-line                       :FG "orange red" :U "green" :H 110 )
  ;; (mode-line-inactive              :FG "gray40" :U "gray13" :H 110 )
  ;; (mode-line-buffer-id             :FG "deep sky blue" :H 120 )
  ;; (mode-line-emphasis              :W bold )
  ;; (mode-line-highlight             :U "deep sky blue" :O "dark orange" )

  ;; MOUSE highlight
  (highlight :U "red" )

  (region )

  
  (shadow :FG "red"  )
  )
