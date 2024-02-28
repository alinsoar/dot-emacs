
(define-theme-faces
  ;; DEFAULT :BG, FOREGROUND, FONT, FONT HEIGHT
  (default
    :FM (select-face
         "B612 Mono"
         ;; "Inconsolata"
         ;; "Anonymous Pro"
         )
    :BG "pale green" ; CadetBlue2
    :FG (divide-color "deep sky blue" 3)
    :H  150 )

  ;; BUFFER-FACE-MODE
  (buffer-face-mode-face :FG "red")

  ;; VARIABLE-PITCH
  ;; (variable-pitch :H 1.5 )

  ;; FONT-LOCK
  (font-lock-builtin-face               :FG (divide-color "royal blue" 1.5) )
  (font-lock-comment-delimiter-face     :FG "blue" )
  (font-lock-comment-face               :FG "#8b2914"
                                        :U  (divide-color "yellow green" 2)
                                        :SL italic)
  (font-lock-constant-face              :FG (divide-color "blue" 1.5) )
  (font-lock-doc-face                   :FG (divide-color "RoyalBlue" 1.2) )
  (font-lock-function-name-face         :FG (divide-color "red" 2) )
  (font-lock-keyword-face               :FG (divide-color "DarkGoldenrod1" 1.6) )
  (font-lock-negation-char-face         :FG "maroon1" :U t)
  (font-lock-preprocessor-face          :FG "gray35" )
  (font-lock-regexp-grouping-backslash  :FG "red" )
  (font-lock-regexp-grouping-construct  :FG "coral2" )
  (font-lock-string-face                :FG (divide-color "DarkOrchid2" 1.1) )
  (font-lock-type-face                  :FG "OrangeRed1" )
  (font-lock-variable-name-face         :FG "OliveDrab4" )
  (font-lock-warning-face               :FG "DeepPink2" )

  ;; HL-LINE
  (hl-line :U "black"  )

  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "red" :BG "black" )

  ;; REGION
  (region :U "orange" :ST "dark olive green" :E nil)

  ;; LEFT MARGIN
  (left-margin :BG "red" :FG "red" )

  ;; MOUSE HIGHLIGHT
  (highlight :U "light green")

  ;; `CURSOR-FACE` DOES NOT TAKE LOCAL ACTION -- WHY ?
  (cursor :BG "red" )

  ;; LINUM
  (linum :FG "OrangeRed3" :H 100 )


  ;; INTERACTIVE SEARCH
  (isearch :BG (divide-color "spring green" .7)
           :FG "black"
           ;; :BX "brown"
           :U (::S "wave" ::C "red")
           )
  (isearch-group-1 :FG "red")
  (isearch-group-2 :FG "red")
  (isearch-fail :BG (divide-color "spring green" .7)
                :FG "red"
                :U (::S "wave" ::C "red")
                )

  ;; not focused matches
  (lazy-highlight :BG (divide-color "spring green" .7)
                  :FG "saddle brown"
                  ;; :BX "brown"
                  :U (::S "wave" ::C "red")
                  )

  ;; PAREN MATCH
  (show-paren-match :FG "red"
                    :BG (divide-color "spring green" .7)
                    ;; :BX "red"
                    )

  )
