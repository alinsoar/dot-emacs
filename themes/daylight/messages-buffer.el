
(define-theme-faces
  ;; BACKGROUND, FOREGROUND, FONT, FONT HEIGHT
  (default :FM "Anonymous Pro"
    :BG "spring green"
    :FG "#002000"
    :H 105  )

  ;; WIDGET FACES
  (widget-button                   :BG "gray10" :FG "red" )
  (widget-button-pressed           :BG "gray20" :FG "yellow" )
  (widget-documentation            :BG "gray30" :FG "green" )
  (widget-field                    :BG "#101010" :FG "brown" )
  (widget-inactive                 :BG "DarkBlue" :FG "cyan" )
  (widget-single-line-field        :BG "gray60" :FG "magenta" )

  ;; MODE-LINE
  ;; (mode-line                       :FG "orange red"
  ;;                                  :U "red"
  ;;                                  :BG "spring green"
  ;;                                  )
  ;; (mode-line-inactive              :FG "spring green"
  ;;                                  :BG "spring green"
  ;;                                  :U "#002000"
  ;;                                  ;;:H 110 
  ;;                                  )
  ;; (mode-line-buffer-id             :FG "medium blue"
  ;;                                  :BG "spring green"

  ;;                                  ;;:H 120
  ;;                                  )
  ;; (mode-line-emphasis              :W bold )
  ;; (mode-line-highlight             :U "deep sky blue" :O "dark orange" )

  ;; MOUSE HIGHLIGHT
  (highlight :U "green")

  ;; ;; HL-LINE
  ;; (hl-line (:U "SeaGreen1" ) )

  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "red" )

  ;; REGION
  (region :U "SpringGreen" )

  )
