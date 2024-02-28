
(define-theme-faces
  (default
    :FM (select-face
       "B612 Mono"
       ;; "Monaco"
       ;; "Inconsolata"
       ;; "Anonymous Pro"
       )
    :BG (divide-color "turquoise" 0.9)
    :FG "black"
    :H 120
    )

  ;; BUFFER-FACE-MODE
  (buffer-face-mode-face )

  ;; VARIABLE-PITCH
  ;; (variable-pitch (:H 1.5) )

  ;; FONT-LOCK
  (font-lock-builtin-face              :FG "royal blue" )
  (font-lock-comment-delimiter-face    :FG "DarkGreen" )
  (font-lock-comment-face              :FG "dark slate gray")
  (font-lock-constant-face             :FG (divide-color "gold" 2) )
  (font-lock-doc-face                  :FG "LightBlue4" )
  (font-lock-function-name-face        :FG "IndianRed1" )
  (font-lock-keyword-face              :FG (divide-color "lawn green" 2) )
  (font-lock-negation-char-face        :FG "maroon1" )
  (font-lock-preprocessor-face         :FG  "brown" )
  (font-lock-reference-face            :BX t )
  (font-lock-regexp-grouping-backslash :FG "SpringGreen2" )
  (font-lock-regexp-grouping-construct :FG "coral2" )
  (font-lock-string-face               :FG "medium blue" )
  (font-lock-type-face                 :FG  "DeepSkyBlue4" )
  (font-lock-variable-name-face        :FG (divide-color "dark red" .6) )
  (font-lock-warning-face              :FG "red" )

  ;; NOT SURE WHAT THESE 2 FACES ARE GOOD FOR
  (c-annotation-face :U t )
  (c-nonbreakable-space-face :U t :BX t )

  ;; HL-LINE
  (hl-line :U "black"  )

  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "cyan" :BG "black" )

  ;; REGION
  (region :U "orange" :ST "dark olive green" )

  ;; MODE-LINE
  ;; (mode-line                        :FG "orange red"
  ;;                                   :BG (divide-color "turquoise" 0.9)
  ;;                                   :U "green"
  ;;                                   ;;:H 110
  ;;                                   )
  ;; (mode-line-inactive               :FG "gray40" :U "gray13"
  ;;                                   :BG (divide-color "turquoise" 0.9)
  ;;                                   ;;:H 110
  ;;                                   )
  ;; (mode-line-buffer-id              :FG "black"
  ;;                                   :BG (divide-color "turquoise" 0.9)
  ;;                                   ;;:H 120
  ;;                                   )
  ;; (mode-line-emphasis               :W bold
  ;;                                   )
  ;; (mode-line-highlight              :U "deep sky blue" :O "dark orange" )

  ;; ;; VERTICAL LINE -- just for TTY
  ;; (vertical-border ((t (:FG "lime green"))))

  ;; LEFT MARGIN
  (left-margin :BG "red" :FG "red" )

  ;; LINUM
  (linum :FG "OrangeRed3" :H 100 )

  ;; TODO
  ;; line-number
  ;; line-number-current-line
  ;; line-number-major-tick
  ;; line-number-minor-tick

  (glyphless-char :BG "red")

  ;; PAREN MATCH
  (show-paren-match :FG "red" :BG (divide-color "turquoise" 0.9))

  (trailing-whitespace :BG "deep pink")

  )
