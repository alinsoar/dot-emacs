
(define-theme-faces
  ;; (default :FM "Monaco" :BG "gainsboro" :FG "#0000A0" )

  (default
    :FM "B612 Mono"
    :BG (divide-color "turquoise" 0.9)
    :FG "black" :H 120
    )

  ;; ;; BUFFER-FACE-MODE
  (buffer-face-mode-face :FG "red")

  ;; ;; VARIABLE-PITCH
  ;; (variable-pitch (:FM "Inconsolata" :H 1.5) )

  ;; MOUSE HIGHLIGHT
  (highlight :U "red" )

  ;; FONT-LOCK for OUTPUT
  (font-lock-string-face           :FM "B612 Mono"
                                   :FG (divide-color "dark olive green" 3) )
  (dir-face                        :FM "B612 Mono" :FG "red")

  ;; HL-LINE
  (hl-line :U "MediumSpringGreen"  )

  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "red" :BG "black" )

  ;; REGION
  (region :ST "dark slate gray" )

  ;; MODE-LINE
  (mode-line                       :FM "B612 Mono" :FG "red"
                                   :BG (divide-color "turquoise" 0.9)
                                   :U "gold4" )
  (mode-line-inactive              :FG "gray40" :U "gray13"
                                   :BG (divide-color "turquoise" 0.9)
                                   )
  (mode-line-buffer-id             :FG "RosyBrown4" )
  (mode-line-emphasis              :FG "cyan"  )
  (mode-line-highlight             :FG "SandyBrown" :O "medium spring green" )

  ;; VERTICAL LINE -- just for TTY
  (vertical-border                 :FG "lime green")

  ;; LEFT MARGIN
  (left-margin :BG "red" :FG "red" )

  ;; LINUM
  (linum :FG "gold" )
  )

;;(setenv "PS1" "#")
