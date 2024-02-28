
(define-theme-faces
 ;; BACKGROUND, FOREGROUND, FONT, FONT HEIGHT
  (default :FM "Inconsolata"
    :BG "lime green"
    :FG "black"
    :H 130 )

 (completions-annotations          :FG "red" )
 (completions-common-part          :FG "blue" )
 (completions-first-difference     :FG "yellow" )

 ;; MODE-LINE
 ;; (mode-line                        :FG "orange red"
 ;;                                   :U "blue" ;;
 ;;                                   :BG "lime green"
 ;;                                   )
 ;; (mode-line-inactive               :FG "gray40" :U "gray13";; :H 110  
 ;;                                   :BG "lime green"
 ;;                                   )
 ;; (mode-line-buffer-id              :FG "blue";; :H 120
 ;;                                   )
 ;; (mode-line-emphasis               :W bold )
 ;; (mode-line-highlight              :U "blue" :O "dark orange" )

 ;; LEFT MARGIN
 (left-margin :BG "red" :FG "red" )

 ;; FRINGE -- FRAME SPECIFIC
 (fringe :FG "red" :BG "black" )

 ;; REGION
 (region :U "orange" :ST "dark olive green" )

 (highlight :U "green")

 )

