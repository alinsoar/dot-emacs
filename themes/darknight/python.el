
(define-theme-faces
  
  (default :FM "Monaco" :BG "black" :FG "gray77" :H 120  )

  ;; BUFFER-FACE-MODE
  (buffer-face-mode-face :I default)

  ;; ;; VARIABLE-PITCH
  ;; (variable-pitch ( :H 1.5) )

  ;; FONT-LOCK
  (font-lock-builtin-face          :FG "royal blue"  :I default)
  (font-lock-comment-delimiter-face :FG "DarkGreen"    :I default)
  (font-lock-comment-face          :FG "SaddleBrown"   :I default)
  (font-lock-constant-face         :FG "gold2"   :I default)
  (font-lock-doc-face              :FG "LightBlue4"   :I default) ;NOT USED in python
  (font-lock-function-name-face    :FG "indian red"   :I default)
  (font-lock-keyword-face          :FG "DarkGoldenrod4"   :I default)
  (font-lock-negation-char-face    :FG "maroon1" :BG "LightSalmon2"  :I default)
  (font-lock-preprocessor-face     :FG "gray35"   :I default)
  (font-lock-regexp-grouping-backslash :FG "SpringGreen2"   :I default)
  (font-lock-regexp-grouping-construct :FG "coral2"   :I default)
  (font-lock-string-face           :FG "lawn green" :I default)
  (font-lock-type-face             :FG "OrangeRed1"   :I default)
  (font-lock-variable-name-face    :FG "LightSeaGreen"  :I default)
  (font-lock-warning-face          :FG "honeydew3"  :I default) ; NOT USED in python mode

  ;; HL-LINE
  (hl-line :U "SeaGreen1"  )

  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "red" :BG "black" )

  ;; REGION
  (region :U "orange" :ST "dark olive green" )

  ;; MODE-LINE
  (mode-line                       :FG "orange red" :U "green" :H 110 :I default)
  (mode-line-inactive              :FG "gray40" :U "gray13" :H 110 :I default)
  (mode-line-buffer-id             :FG "deep sky blue" :H 120 )
  (mode-line-emphasis              :W bold )
  (mode-line-highlight             :U "deep sky blue" :O "dark orange" )

  ;; ;; VERTICAL LINE -- just for TTY
  ;; (vertical-border ((t (:FG "lime green"))))

  ;; LEFT MARGIN
  (left-margin :BG "red" :FG "red" )

  ;; LINUM
  (linum :FG "OrangeRed3" :H 100 )
  )


