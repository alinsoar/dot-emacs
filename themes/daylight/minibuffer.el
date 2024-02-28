
(with-current-buffer
    (window-buffer (minibuffer-window))
  (define-theme-faces
    (default
      :FM "B612 Mono"
      :H 200
      :BG "RoyalBlue1"
      :FG "navajo white")
    (minibuffer-prompt
     :FG "dark red"
     )))

(push-cursor-color mini-saved-cursor-color "white")
