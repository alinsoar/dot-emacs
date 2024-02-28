
;; err

(define-theme-faces
  (default
    :FM "Monaco"
    :BG (divide-color "firebrick3" .25)
    :FG "black"
    :H 120
    )

  ;; MOUSE highlight links
  (highlight :FG "black"
             :U (::S wave)
             
             )

  (button :FG "dark slate gray"
          )

  ;; MODE-LINE
  ;; (mode-line                       :FG "orange red" :U "green" :H 110)
  ;; (mode-line-inactive              :FG "gray40" :U "gray13" :H 110)
  ;; (mode-line-buffer-id             :FG "deep sky blue" :H 120 )
  ;; (mode-line-emphasis              :W bold )
  ;; (mode-line-highlight             :U "deep sky blue" :O "dark orange" )


  (help-function-def-button :FG "blue")

  )

