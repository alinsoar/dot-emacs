
(define-theme-faces
  (default
    :FM "B612 Mono"
    :BG (divide-color "forest green" .25)
    :FG "DodgerBlue4"
    :H 160
    )

  ;; MAGIT
  (:INCLUDE #$ magit.el)
  
  ;; HEADER
  (header-line :FM "Inconsolata"  :FG "yellow" :BG "black" :H 200)

  ;; REGION
  (region :U "orange" :ST "dark olive green" )

  ;; MODE-LINE
  ;; (mode-line                       :FG "orange red" :U "green" :H 110)
  ;; (mode-line-inactive              :FG "gray40" :U "gray13" :H 110)
  ;; (mode-line-buffer-id             :FG "deep sky blue" :H 120 )
  ;; (mode-line-emphasis              :W bold )
  ;; (mode-line-highlight             :U "deep sky blue" :O "dark orange" )

  )

