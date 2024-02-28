
(define-theme-faces
  ;; BACKGROUND, FOREGROUND, FONT, FONT HEIGHT
  (default
    :FM "B612 Mono"
    :BG (divide-color "sea green" 0.7)
    :FG (divide-color "blue4" 2)
    :H 200)

  (dired-directory    :FG "dark slate gray")
  (dired-flagged      :FG "green" :ST "yellow4")
  (dired-header       :FG "dark olive green"  )
  (dired-ignored      :FG "black" :ST "dark blue"  )
  (dired-mark         :FG "chocolate")
  (dired-marked       :U  "brown")
  (dired-perm-write   :FG "khaki"  )
  (dired-symlink      :FG (divide-color "honeydew4" 2)  )
  (dired-warning      :FG "turquoise3" :U "OrangeRed"  )

  (highlight :U "red" )

  ;; ;; HL-LINE
  ;; (hl-line (:U "SeaGreen1" ) )

  ;; FRINGE -- FRAME SPECIFIC
  (fringe :FG "black" :BG "black" )

  ;; REGION
  (region :U "saddle brown")

  ;; MODE-LINE
  ;; (mode-line                       :FG "orange red"
  ;;                                  :U "green"
  ;;                                  :BG (divide-color "sea green" 0.7)
  ;;                                  ;; :H 110
  ;;                                  ;;
  ;;                                  )
  ;; (mode-line-inactive              :FG "gray40"
  ;;                                  :U "gray13"
  ;;                                  :BG (divide-color "sea green" 0.7)
  ;;                                  ;; :H 110
  ;;                                  ;;
  ;;                                  )
  ;; (mode-line-buffer-id             :FG "blue"
  ;;                                  ;; :H 120
  ;;                                  )
  ;; (mode-line-emphasis              :W bold)
  ;; (mode-line-highlight             :U "blue" :O "dark orange" )

  ;; ;; VERTICAL LINE -- just for TTY
  ;; (vertical-border ((t (:FG "lime green"))))

  ;;
  (cursor :BG "red" :FG "red" )

  ;; LEFT MARGIN
  (left-margin :BG "red" :FG "red" )

  ;; LINUM
  (linum :FG "OrangeRed3" :H 100 )
  )

(dired-make-faces c
                  (:FG "LemonChiffon")
                  (:FG "yellow"))
(dired-make-faces python
                  (:FG "white")
                  (:FG "green"))
(dired-make-faces javascript
                  (:FG "brown")
                  (:FG "brown"))
(dired-make-faces java
                  (:FG "brown")
                  (:FG "dark goldenrod"))
(dired-make-faces emacs-lisp
                  (:FG "navy blue")
                  (:FG "blue violet"))
(dired-make-faces scheme
                  (:FG "floral white")
                  (:FG "khaki"))
(dired-make-faces racket
                  (:FG "peru")
                  (:FG "cyan"))
(dired-make-faces pdf
                  (:FG "OrangeRed4")
                  (:FG "medium blue"))
(dired-make-faces dejavu
                  (:FG "sea green")
                  (:FG "dark olive green"))
(dired-make-faces archive
                  (:FG "ForestGreen")
                  (:FG "green"))
(dired-make-faces text
                  (:FG "chartreuse4")
                  (:FG "saddle brown"))
(dired-make-faces imagefile
                  (:FG "red")
                  (:FG "yellow"))
(dired-make-faces compiled
                  (:ST "gray20" :FG "gray50")
                  (:FG "gray30"))
(dired-make-faces hypertext
                  (:FG "red")
                  (:FG "blue"))
(dired-make-faces style-sheets
                  (:FG "yellow")
                  (:FG "blue"))
(dired-make-faces sql
                  (:FG "saddle brown")
                  (:FG "red"))
(dired-make-faces php
                  (:FG (divide-color "dark orange" 1.2))
                  (:FG "yellow4"))
(dired-make-faces shell
                  (:FG "gold")
                  (:FG "yellow4"))

(dired-make-single-face makefile (:FG "sienna"))
(dired-make-single-face makefile-ext (:FG "violet red"))
(dired-make-single-face uppercase (:FG "aquamarine"))
(dired-make-single-face config (:FG "PeachPuff4"))

;;; file listing information columns
(dired-make-single-face size
                        (:FG "SeaGreen4") )
(dired-make-single-face month
                        (:FG "royal blue") )
(dired-make-single-face day
                        (:FG "royal blue") )
(dired-make-single-face year-hour
                        (:FG "sea green") )
(dired-make-single-face user
                        (:FG "brown") )
(dired-make-single-face group
                        (:FG "midnight blue") )
(dired-make-single-face hardlink-count
                        (:FG "black") )


