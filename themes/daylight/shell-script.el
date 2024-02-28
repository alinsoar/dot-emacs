
(define-theme-faces
  (default :FM "B612 Mono" :BG (divide-color "brown1" .27)
    :FG "black" :H 120  )

  ;; BUFFER-FACE-MODE
  (buffer-face-mode-face :FG "red")

  ;; ;; VARIABLE-PITCH
  ;; (variable-pitch ( :H 1.5) )

  ;; FONT-LOCK
  (font-lock-builtin-face          :FG "royal blue" )
  (font-lock-comment-delimiter-face :FG "DarkGreen" )
  (font-lock-comment-face          :FG "SaddleBrown" )
  (font-lock-constant-face         :FG "gold2" )
  (font-lock-doc-face              :FG "LightBlue4" )
  (font-lock-function-name-face    :FG "indian red" )
  (font-lock-keyword-face          :FG "dark slate gray" )
  (font-lock-negation-char-face    :FG "maroon1" :U t )
  (font-lock-preprocessor-face     :FG "gray35" )
  (font-lock-regexp-grouping-backslash :FG "SpringGreen2" )
  (font-lock-regexp-grouping-construct :FG "coral2" )
  (font-lock-string-face           :FG "medium blue" )
  (font-lock-type-face             :FG "OrangeRed1" )
  (font-lock-variable-name-face    :FG "red" )
  (font-lock-warning-face          :FG "honeydew3" )

  ;; HL-LINE
  (hl-line :U "SeaGreen1"  )

  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "red" :BG "black" )

  ;; REGION
  (region :U "orange" :ST "dark olive green" )

  ;; MODE-LINE
  ;; (mode-line                       :FG "orange red" :U "green" :H 110 )
  ;; (mode-line-inactive              :FG "gray40" :U "gray13" :H 110 )
  ;; (mode-line-buffer-id             :FG "deep sky blue" :H 120 )
  ;; (mode-line-emphasis              :W bold )
  ;; (mode-line-highlight             :U "deep sky blue" :O "dark orange" )

  ;; ;; VERTICAL LINE -- just for TTY
  ;; (vertical-border ((t (:FG "lime green"))))

  ;; LEFT MARGIN
  (left-margin :BG "red" :FG "red" )

  ;; LINUM
  (linum :FG "OrangeRed3" :H 100 )
  )


