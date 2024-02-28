
(define-theme-faces
  (default
    :FM "Inconsolata"
    :BG "sandy brown"
    :FG "black"
    :H 180  )

  (makefile-makepp-perl           :FG "blue" )
  (makefile-shell                 :FG "dark magenta" )
  (makefile-space                 :BG "red")
  (makefile-targets               :FG "DarkCyan")

  ;; FONT-LOCK
  (font-lock-builtin-face               :FG "royal blue" )
  (font-lock-comment-delimiter-face     :FG "DarkGreen" )
  (font-lock-comment-face               :FG "saddle brown" )
  (font-lock-constant-face              :FG "DodgerBlue3" )
  (font-lock-doc-face                   :FG "LightBlue4" )
  (font-lock-function-name-face         :FG "indian red" )
  (font-lock-keyword-face               :FG "dark slate gray" )
  (font-lock-negation-char-face         :FG "maroon1" )
  (font-lock-preprocessor-face          :FG "gray35" )
  (font-lock-regexp-grouping-backslash  :FG "SpringGreen2" )
  (font-lock-regexp-grouping-construct  :FG "coral2" )
  (font-lock-string-face                :FG "DarkSlateGray" )
  (font-lock-type-face                  :FG "OrangeRed1" )
  (font-lock-variable-name-face         :FG (divide-color "LightSeaGreen" 2) )
  (font-lock-warning-face               :FG "honeydew3" )

  ;; HL-LINE
  (hl-line :U "SeaGreen1"  )

  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "blue" :BG "black" )

  ;; REGION (format "%x" (/ #x2f 5)) = darken
  (region :U (divide-color "olive drab" 3)
          :ST (divide-color "dark olive green" 4))

  ;; MODE-LINE
  ;; (mode-line                       :FG "brown" :U "green"
  ;;                                  :BG "sandy brown"
  ;;                                  ;; :H 110  
  ;;                                  )
  ;; (mode-line-inactive              :FG "gray40" :U "gray13";; :H 110  
  ;;                                  :BG "sandy brown"
  ;;                                  )
  ;; (mode-line-buffer-id             :FG "blue";; :H 120
  ;;                                  )
  ;; (mode-line-emphasis              :W bold )
  ;; (mode-line-highlight             :U "deep sky blue" :O "dark orange" )

  ;; LEFT MARGIN
  (left-margin :BG "red" :FG "red" )

  ;; LINUM
  (linum :FG "OrangeRed3" :H 100 )
  )
