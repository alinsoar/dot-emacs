

(define-theme-faces
  ;; BACKGROUND, FOREGROUND, FONT, FONT HEIGHT
  (default
    :FM "B612 Mono"
    :BG "lime green"
    :FG "#001000"
    :H 120
    )

  ;; FACES

  (Man-overstrike                   :FG "white" :U "orange red")
  (Man-reverse                      :FG "gray40" :U "gray13" :H 110)
  (Man-underline                    :U "deep sky blue")

  
  ;; MODE-LINE
  ;; (mode-line                        :FG "orange red" :U "red" )
  ;; (mode-line-inactive               :FG "gray40" :U "gray13" :H 110 )
  ;; (mode-line-buffer-id              :FG "deep sky blue" :H 120 )
  ;; (mode-line-emphasis               :W bold )
  ;; (mode-line-highlight              :U "deep sky blue" :O "dark orange" )

  ;; MOUSE HIGHLIGHT
  (highlight :U "green")

  ;; ;; HL-LINE
  ;; (hl-line (:U "SeaGreen1" ) )

  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "red" )

  ;; REGION
  (region :U "#A00000" )

  ;; LINK to other man pages
  (button :FG "DarkGoldenrod2" :ST "gray10" )
  )
