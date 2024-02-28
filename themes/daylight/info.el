
(define-theme-faces
  ;; BACKGROUND, FOREGROUND, FONT, FONT HEIGHT
  (default
    :BG "#cdc2b2"
    :FG "black"
    :H 200)

  ;; ALL INFO PAGES FACES
  (info-header-node                :FG "indian red" :U "red")
  (info-header-xref                :FG "DarkOrange1" )
  (info-index-match                :FG "cyan2" )
  (info-menu-header                :FG "dd0000"         :FM "Inconsolata" )
  (info-menu-star                  :FG "ff0000"         :FM "Inconsolata" )
  (info-node                       :FG "LightSlateBlue" )
  (info-title-1                    :FG "dark cyan" :FM "Anonymous Pro" :U "dark slate gray")
  (info-title-2                    :FG "dark cyan" :FM "Anonymous Pro" :U "dark slate gray")
  (info-title-3                    :FG "dark cyan" :FM "Anonymous Pro" :U "dark slate gray")
  (info-title-4                    :FG "dark cyan" :FM "Anonymous Pro" :U "dark slate gray")
  (info-xref                       :FG "#0077bb" )
  (info-xref-visited               :FG "#00a030" )
  
  (region :U "red")

  ;; MOUSE
  (highlight :U (divide-color "cyan" 3))

  (header-line :BG "cyan" :FG "dark green" :U "red")

  ;; MODE-LINE
  ;; (mode-line                       :FG "orange red" :U "green" )
  ;; (mode-line-inactive              :FG "gray40" :U "gray13" )
  ;; (mode-line-buffer-id             :FG "deep sky blue" )
  ;; (mode-line-emphasis              :W bold)
  ;; (mode-line-highlight             :U "deep sky blue" :O "dark orange")

  (cursor :BG "red")

  ;; INTERACTIVE SEARCH
  (isearch :BG "papaya whip"
           :FG "black"
           :BX "brown"
           )
  ;; isearch-group-1 
  ;; isearch-group-2
  (isearch-fail :BG "papaya whip"
                :FG "red"
                :U (::S "wave" ::C "red")
                )
  
  ;; not focused matches
  (lazy-highlight :BG "papaya whip"
                  :FG "green"
                  :BX "brown"
                  ))

;; CURSOR
;; (load-config 'cursor 'conf)

(set-cursor-color "red")
(with-current-buffer "*info*"
  (setq cursor-type '(hbar . 8)))

