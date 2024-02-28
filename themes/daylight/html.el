
(define-theme-faces
 (default
  :FM "Monaco"
  :BG "gray77"
  :FG "black"
  :H 120  )

 ;; BUFFER-FACE-MODE
 (buffer-face-mode-face)

 ;; ;; VARIABLE-PITCH
 ;; (variable-pitch (:H 1.5) )

 ;; FONT-LOCK
 (font-lock-builtin-face          :FG "royal blue" )
 (font-lock-comment-delimiter-face :FG "DarkGreen" )
 (font-lock-comment-face          :FG (divide-color "LightSeaGreen" 1.4) )
 (font-lock-constant-face         :FG "OrangeRed" )
 (font-lock-doc-face              :FG "LightBlue4" )
 (font-lock-function-name-face    :FG "DarkRed" )
 (font-lock-keyword-face          :FG "SaddleBrown" )
 (font-lock-negation-char-face    :FG "maroon1" )
 (font-lock-preprocessor-face     :FG "slate gray" )
 (font-lock-reference-face        :BX t )
 (font-lock-regexp-grouping-backslash :FG "SpringGreen2" )
 (font-lock-regexp-grouping-construct :FG "coral2" )
 (font-lock-string-face           :FG (divide-color "DarkOliveGreen" 2) )
 (font-lock-type-face             :FG "OrangeRed1" )
 (font-lock-variable-name-face    :FG (divide-color "DodgerBlue" 2) )
 (font-lock-warning-face          :FG "honeydew3" )

 ;; HL-LINE
 ;; (hl-line :U "red"  )

 ;; FRINGE -- FRAME SPECIFIC
 (fringe :FG "cyan" :BG "black" )

 ;; REGION
 (region ;; :U "orange"
  :ST "dark olive green" )

 ;; MODE-LINE
 ;; (mode-line                       :FG "orange red" :U "green" :H 110 )
 ;; (mode-line-inactive              :FG "gray40" :U "gray13" :H 110 )
 ;; (mode-line-buffer-id             :FG "blue" :H 120 )
 ;; (mode-line-emphasis              :W bold )
 ;; (mode-line-highlight             :U "deep sky blue" :O "dark orange" )

 ;; ;; VERTICAL LINE -- just for TTY
 ;; (vertical-border ((t (:FG "lime green"))))

 ;; LEFT MARGIN
 (left-margin :BG "red" :FG "red" )

 ;; LINUM
 (linum :FG "OrangeRed3" :H 100 )

 ;; CURSOR is set via frame-parameters
 ;; (cursor (:FG "red") )


 ;; INTERACTIVE SEARCH
 (isearch :FG "black"
          :BX "brown"
          )
 ;; isearch-group-1
 ;; isearch-group-2
 (isearch-fail :BG "papaya whip"
               :FG "red"
               ;; :U (::S "wave" ::C "red")
               )

 ;; not focused matches
 (lazy-highlight
  :FG "blue"
  :BX "brown"
  ))



