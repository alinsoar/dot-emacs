
;; THE ONLY customization that I use all over is the default theme.

;; No other customization is used. Custom is used when I want to
;; extract data (using "chcol") that Customization mode saves in the
;; custom file. I move the configurations generated there in the
;; corresponding files.


(custom-set-faces
 ;; custom-set-faces was added by Custom.

 (global-face default
              ;; :I nil
              :T nil
              :BG "#FFDEAD"
              :FG "#001122"
              :IV nil
              :BX nil
              :ST nil
              :O nil
              :U nil
              :SL normal
              :W normal
              :H 120
              :FO "unknown"
              :FM "B612 Mono"
              )

 (global-face mode-line :FG "orange red" :E t :BX "#000077" :BG "PaleGreen1" )
 (global-face mode-line-inactive :BX "#000077" :BG "dark gray")
 (global-face mode-line-buffer-id :FG (divide-color "cyan" 3))
 (global-face mode-line-emphasis :W bold)
 (global-face mode-line-highlight :U "deep sky blue" :O "dark orange" )

 '(file-name-shadow ((t (:underline (:style wave :color "red") :strike-through "DarkOliveGreen"))))
 '(secondary-selection ((t (:underline (:style wave :color "red")))))
 '(query-replace ((t (:underline "cyan" :foreground "red"))))
 '(lazy-highlight ((t (:underline "blue" :foreground "yellow"))))
 '(custom-visibility ((t (:foreground "red" ))))

 (global-face tab-bar              :FM "B612 Mono" :BG "MediumAquamarine" :FG "cyan" :H 200)
 (global-face tab-bar-tab          :FM "B612 Mono" :BG "MediumAquamarine" :FG "red" :H 200)
 (global-face tab-bar-tab-inactive :FM "B612 Mono" :BG "MediumAquamarine" :FG "blue" :H 200)

 (global-face tab-line                        :FM "B612 Mono" :BG "NavajoWhite2" :FG "yellow" :H 250)
 (global-face tab-line-close-highlight        :FM "B612 Mono" :BG "NavajoWhite2" :FG "forest green" :H 250)
 (global-face tab-line-highlight              :FM "B612 Mono" :BG "NavajoWhite2" :FG "saddle brown" :H 250)
 (global-face tab-line-tab                    :FM "B612 Mono" :BG "NavajoWhite2" :FG "black" :H 250)
 (global-face tab-line-tab-current            :FM "B612 Mono" :BG "NavajoWhite2" :FG "black" :H 250 :U (::S wave ::C "red"))
 (global-face tab-line-tab-group              :FM "B612 Mono" :BG "NavajoWhite2" :FG "beige" :H 250)
 (global-face tab-line-tab-inactive           :FM "B612 Mono" :BG "NavajoWhite2" :FG "chartreuse4" :H 250)
 (global-face tab-line-tab-inactive-alternate :FM "B612 Mono" :BG "NavajoWhite2" :FG "turquoise4" :H 250)
 (global-face tab-line-tab-modified           :FM "B612 Mono" :BG "NavajoWhite2" :FG "orange red" :H 250)
 (global-face tab-line-tab-special            :FM "B612 Mono" :BG "NavajoWhite2" :FG "aquamarine4" :H 250)

 )
