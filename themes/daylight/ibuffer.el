
(define-theme-faces
  (default
    :FM "Anonymous Pro"
    :BG "#00DED0"
    :FG "#001010"
    )

  ;; FONT-LOCK
  (font-lock-builtin-face              :FG "royal blue"  )
  (font-lock-comment-delimiter-face    :FG "firebrick3"    )
  (font-lock-comment-face              :FG "MediumSpringGreen"   )
  (font-lock-constant-face             :FG "red" )
  (font-lock-doc-face                  :FG "LightBlue4"   )
  (font-lock-function-name-face        :FG "indian red"   )
  (font-lock-keyword-face              :FG "dark olive green"   )
  (font-lock-negation-char-face        :FG "maroon1"  )
  (font-lock-preprocessor-face         :FG "slate gray"   )
  (font-lock-reference-face            :BX t )
  (font-lock-regexp-grouping-backslash :FG "SpringGreen2"   )
  (font-lock-regexp-grouping-construct :FG "coral2"   )
  (font-lock-string-face               :FG "lawn green" )
  (font-lock-type-face                 :FG "OrangeRed1"   )
  (font-lock-variable-name-face        :FG "LightSeaGreen"  )
  (font-lock-warning-face              :FG "honeydew3"  )

  ;; HL-LINE
  (hl-line :U "MediumSpringGreen"  )

  ;; HL-LINE
  (error :ST "honeydew3")

  
  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "red" :BG "black" )

  ;; REGION
  (region :U "orange" )

  ;; MODE-LINE
  ;; (mode-line                       :FM "Monaco"
  ;;                                  :FG "brown"
  ;;                                  :BG "#00DED0"
  ;;                                  :U "gold4"
  ;;                                  ;;:H 120
  ;;                                  )
  ;; (mode-line-inactive              :FG "gray40"
  ;;                                  :BG "#00DED0"
  ;;                                  :U "gray13"
  ;;                                  ;;:H 120
  ;;                                  )
  ;; (mode-line-buffer-id             :FG "blue";; :H 120
  ;;                                  )
  ;; (mode-line-emphasis              :FG "cyan"  )
  ;; (mode-line-highlight             :FG "SandyBrown" :O "medium spring green"
  ;;                                  ;;:H 150
  ;;                                  )

  ;; ;; VERTICAL LINE -- just for TTY
  ;; (vertical-border ((t (:FG "lime green"))))

  ;; LEFT MARGIN
  (left-margin :BG "red" :FG "red" )

  ;; ;; LINUM
  ;; (linum (:FG "gold" :H 100) )

  (header-line :BG "#002d10")

  (highlight :U "green")

  )

